#!/bin/bash
echo '******Installing PostgreSQL******' >> /var/log/cloud/f5-vnf/cloud_config.log

# Install PostgreSQL 9.5 client
sudo yum -y install postgresql postgresql-server postgresql-contrib

# Initialize and start database service
sudo postgresql-setup initdb
sudo systemctl start postgresql

# Change postgres user password and add to sudoers
sudo passwd postgres << EOF
f5networks
f5networks
EOF

# Set-up f5_db database and create tables
if [ -z ${db_sslkey} ]; then
    su - postgres -c "createuser -s ${db_user}" << EOF
f5networks
EOF
else
    su - postgres -c "createuser -P -s ${db_user}" << EOF
f5networks
${db_password}
${db_password}
EOF
fi

su - postgres -c "createdb -O ${db_user} ${db_name}" << EOF
f5networks
EOF

su - postgres -c "psql" << EOF
f5networks
\c ${db_name}

CREATE TABLE Subnets(
    id SERIAL PRIMARY KEY,
    vlan_id VARCHAR(255),
    deployment_id VARCHAR(255)
);
GRANT ALL PRIVILEGES ON Subnets to ${db_user};

CREATE TABLE Deployments(
    id VARCHAR(255) PRIMARY KEY
);
GRANT ALL PRIVILEGES ON Deployments to ${db_user};

CREATE TABLE IPs(
    id SERIAL PRIMARY KEY,
    ip VARCHAR(255),
    used BOOLEAN,
    subnet INTEGER REFERENCES Subnets(id) ON DELETE CASCADE,
    deployment VARCHAR(255) REFERENCES Deployments(id) ON DELETE CASCADE
);
GRANT ALL PRIVILEGES ON IPs to ${db_user};
GRANT ALL PRIVILEGES ON ips_id_seq to ${db_user};
GRANT ALL PRIVILEGES ON subnets_id_seq to ${db_user};

CREATE TABLE CGNAT_DEPLOYMENTS(
    id VARCHAR(255) PRIMARY KEY,
    enabled BOOLEAN
);
GRANT ALL PRIVILEGES ON CGNAT_DEPLOYMENTS to ${db_user};

CREATE TABLE CGNAT_IPs(
    ip VARCHAR(255) PRIMARY KEY,
    used BOOLEAN,
    deployment VARCHAR(255) REFERENCES CGNAT_DEPLOYMENTS(id) ON DELETE CASCADE
);
GRANT ALL PRIVILEGES ON CGNAT_IPs to ${db_user};

CREATE TABLE Layers(
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    sku VARCHAR(255),
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP
);
GRANT ALL PRIVILEGES ON Layers to ${db_user};

CREATE TABLE VEs(
    id VARCHAR(255) PRIMARY KEY,
    hostname VARCHAR(255),
    layer_uuid VARCHAR(255) REFERENCES Layers(id)
);
GRANT ALL PRIVILEGES ON VEs to ${db_user};

CREATE TABLE BIGIQInstances(
    id VARCHAR(255) PRIMARY KEY,
    hostname VARCHAR(255),
    sku VARCHAR(255),
    granted TIMESTAMP,
    revoked TIMESTAMP,
    type VARCHAR(255),
    uom VARCHAR(255),
    address VARCHAR(255)
);
GRANT ALL PRIVILEGES ON BIGIQInstances to ${db_user};
EOF

echo '******PostgreSQL CA Authentication configuration******' >> /var/log/cloud/f5-vnf/cloud_config.log

# Create a directory for ca authentication files
mkdir ~/ca
cd ~/ca

if [ -z ${db_sslrootcert} ]; then
  # Create root CA certificate
  openssl req -new -nodes -out root-ca.csr -keyout root-ca-key.pem \
      -subj "/CN=pg-ca/O=${db_sslorganization}"

  openssl x509 -req -in root-ca.csr -days ${db_sslrootcert_expiration} \
      -signkey root-ca-key.pem -out root-ca-cert.pem

  psql_path="/var/lib/pgsql/.postgresql"
  [ ! -d "$psql_path" ] && sudo mkdir -p "$psql_path"
  mv root-ca-cert.pem root.crt
  sudo cp ./root.crt /var/lib/pgsql/.postgresql/root.crt
else
  # Use provided CA certificate to sign server's certificate
  psql_path="/var/lib/pgsql/.postgresql"
  [ ! -d "$psql_path" ] && sudo mkdir -p "$psql_path"

  sudo touch /var/lib/pgsql/.postgresql/root.crt
  echo ${db_sslrootcert} > rtcrt
  sudo mv rtcrt /var/lib/pgsql/.postgresql/root.crt
fi

sudo chown postgres:postgres /var/lib/pgsql/.postgresql/root.crt
sudo chmod 600 /var/lib/pgsql/.postgresql/root.crt

# Generate CA key and certificate for server
openssl req -new -nodes -out pg-server.csr -keyout pg-server-key.pem \
    -subj "/CN=pg-server/O=${db_sslorganization}"

openssl x509 -req -in pg-server.csr -CA root.crt -CAkey root-ca-key.pem \
    -CAcreateserial -days ${db_sslrootcert_expiration} -out pg-server-crt.pem

# Rename created certificate files and apply access
sudo cp ./pg-server-crt.pem /var/lib/pgsql/data/pg-server.crt
sudo chown postgres:postgres /var/lib/pgsql/data/pg-server.crt
sudo chmod 600 /var/lib/pgsql/data/pg-server.crt
sudo restorecon /var/lib/pgsql/data/pg-server.crt
sudo cp ./pg-server-key.pem /var/lib/pgsql/data/pg-server.key

# Change postgresql configuration file to use certificate files
sudo sed -i "s+#ssl = off+ssl = on+g" /var/lib/pgsql/data/postgresql.conf
sudo sed -i "s+#ssl_ca_file = ''+ssl_ca_file = '/var/lib/pgsql/.postgresql/root.crt'+g" /var/lib/pgsql/data/postgresql.conf
sudo sed -i "s+#ssl_cert_file = 'server.crt'+ssl_cert_file = '/var/lib/pgsql/data/pg-server.crt'+g" /var/lib/pgsql/data/postgresql.conf
sudo sed -i "s+#ssl_key_file = 'server.key'+ssl_key_file = '/var/lib/pgsql/data/pg-server.key'+g" /var/lib/pgsql/data/postgresql.conf
sudo sed -i "s+#port = 5432+port = ${db_port}+g" /var/lib/pgsql/data/postgresql.conf
sudo sed -i "s+#listen_addresses = 'localhost'+listen_addresses = '*'+g" /var/lib/pgsql/data/postgresql.conf

# Modify connection restrictions in pg_hba.conf 
echo "# TYPE     DATABASE  USER  CIDR-ADDRESS  METHOD
local      all       all   password
hostnossl  all       all   0.0.0.0/0  password
hostnossl  all       all   ::/0  password
hostssl    all       all   0.0.0.0/0  cert map=cert
hostssl    all       all   ::/0  cert map=cert" > hba
sudo mv hba /var/lib/pgsql/data/pg_hba.conf

# Change postgres map to match "pg/user/postgres"
echo "# MAPNAME  SYSTEM-USERNAME    PG-USERNAME
cert       /^pg-user-(.*)$  \1" > ident
sudo mv ident /var/lib/pgsql/data/pg_ident.conf

sudo chown postgres:postgres /var/lib/pgsql/data/pg_hba.conf
sudo chown postgres:postgres /var/lib/pgsql/data/pg_ident.conf
sudo chmod 600 /var/lib/pgsql/data/pg_hba.conf
sudo chmod 600 /var/lib/pgsql/data/pg_ident.conf

# Reload postgresql
export PGDATA=/var/lib/pgsql/data/
su - postgres -c "pg_ctl -w -D $PGDATA reload" << EOF
f5networks
EOF

openssl rsa -in pg-server-key.pem -out pg-server.new.key

sudo mv pg-server.new.key /var/lib/pgsql/data/pg-server.key
sudo chmod 600 /var/lib/pgsql/data/pg-server.key
sudo chown postgres /var/lib/pgsql/data/pg-server.key

sudo restorecon /var/lib/pgsql/data/pg-server.crt
sudo restorecon /var/lib/pgsql/data/pg-server.key
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Create postgres user certificates
openssl req -new -nodes -out user-postgres.csr -keyout user-postgres-key.pem \
    -subj "/CN=pg-user-postgres/O=${db_sslorganization}"

openssl x509 -req -in user-postgres.csr -CA root.crt -CAkey root-ca-key.pem \
    -CAcreateserial -days ${db_sslrootcert_expiration} \
    -out user-postgres-crt.pem

openssl rsa -in user-postgres-key.pem -out pg-user-postgres.key
rm -f user-postgres-key.pem


# Move key and certificate files into postgres directory
psql_path="/var/lib/pgsql/.postgresql"
[ ! -d "$psql_path" ] && sudo mkdir -p "$psql_path"
sudo mv pg-user-postgres.key /var/lib/pgsql/.postgresql/postgresql.key
sudo mv user-postgres-crt.pem /var/lib/pgsql/.postgresql/postgresql.crt
sudo chown postgres:postgres /var/lib/pgsql/.postgresql/postgresql.crt
sudo chmod 600 /var/lib/pgsql/.postgresql/postgresql.crt
sudo chown postgres:postgres /var/lib/pgsql/.postgresql/postgresql.key
sudo chmod 600 /var/lib/pgsql/.postgresql/postgresql.key

# Restart postgresql
sudo restorecon /var/lib/pgsql/data/pg_hba.conf
sudo restorecon /var/lib/pgsql/data/pg_ident.conf
sudo restorecon /var/lib/pgsql/.postgresql/root.crt
sudo systemctl stop postgresql
sudo systemctl start postgresql

echo '******PostgreSQL service started******' >> /var/log/cloud/f5-vnf/cloud_config.log

if [ -z ${db_sslkey} -a -z ${db_sslcert} ]; then
  
  # Create user's certificates
  openssl req -new -nodes -out user-db.csr -keyout user-db-key.pem \
      -subj "/CN=pg-user-${db_user}/O=${db_sslorganization}"

  openssl x509 -req -in user-db.csr -CA root.crt -CAkey root-ca-key.pem \
      -CAcreateserial -days ${db_sslrootcert_expiration} \
      -out user-db-crt.pem

  openssl rsa -in user-db-key.pem -out pg-user-db.key
  rm -f user-db-key.pem
  mv user-db-crt.pem pg-user-db.crt

  # Save CA certificate files into runtime properties
  key=$(<./pg-user-db.key)
  cert=$(<./pg-user-db.crt)
  
  ctx instance runtime-properties 'postgres_key' "${key}"
  ctx instance runtime-properties 'postgres_crt' "${cert}"
else
  ctx instance runtime-properties 'postgres_key' "${db_sslkey}"
  ctx instance runtime-properties 'postgres_crt' "${db_sslcert}"
fi

echo "******User's certificate files created and stored in runtime properties******" >> /var/log/cloud/f5-vnf/cloud_config.log

# Save CA root certificate into runtime property
rootcrt=$(<./root.crt)
ctx instance runtime-properties 'postgres_rootcrt' "${rootcrt}"

# Clean up remained files for security reasons
cd ~
rm -rf ./ca
