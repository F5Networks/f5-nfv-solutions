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

EOF
