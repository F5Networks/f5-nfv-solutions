F5 Gi-LAN plugin
========================

Use this plugin to create supported, custom blueprints for an original Cloudify v5.0.5 environment.

# Node types

* [f5.gilan.nodes.ConnectionParameters](#f5-.gilan-.nodes-.ConnectionParameters)
* [f5.gilan.nodes.CGNATvnfdProxy](#f5.gilan.nodes.CGNATvnfdProxy)
* [f5.gilan.nodes.CGNATAssigner](#f5.gilan.nodes.CGNATAssigner)
* [f5.gilan.nodes.CGNATConfiguration](#f5.gilan.nodes.CGNATConfiguration)
* [f5.gilan.nodes.RequestsHA](#f5.gilan.nodes.RequestsHA)
* [f5.gilan.nodes.IPManagerConfiguration](#f5.gilan.nodes.IPManagerConfiguration)
* [f5.gilan.nodes.IPAssigner](#f5.gilan.nodes.IPAssigner)
* [f5.gilan.nodes.LSNArbiterPoller](#f5.gilan.nodes.LSNArbiterPoller)
* [f5.gilan.nodes.LSNArbiterNode](#f5.gilan.nodes.LSNArbiterNode)
* [f5.gilan.nodes.ArbiterNode](#f5.gilan.nodes.ArbiterNode)
* [f5.gilan.nodes.InputValidator](#f5.gilan.nodes.InputValidator)
* [f5.gilan.nodes.OutputPoller](#f5.gilan.nodes.OutputPoller)
* [f5.gilan.nodes.NagiosDeploymentID](#f5.gilan.nodes.NagiosDeploymentID)
* [f5.gilan.nodes.NagiosCertGenerator](#f5.gilan.nodes.NagiosCertGenerator)
* [f5.gilan.nodes.Id](#f5.gilan.nodes.Id)
* [f5.gilan.nodes.SoftwareReference](#f5.gilan.nodes.SoftwareReference)
* [f5.gilan.nodes.configuration.MemberRegistrar](#f5.gilan.nodes.configuration.MemberRegistrar)
* [f5.gilan.nodes.DeploymentProxy](#f5.gilan.nodes.DeploymentProxy)
* [f5.gilan.nodes.PortDefinition](#f5.gilan.nodes.PortDefinition)
* [f5.gilan.nodes.deploymentproxy.Slave](#f5.gilan.nodes.deploymentproxy.Slave)
* [f5.gilan.nodes.deploymentproxy.Master](#f5.gilan.nodes.deploymentproxy.Master)
* [f5.gilan.nodes.deploymentproxy.Nsd](#f5.gilan.nodes.deploymentproxy.Nsd)
* [f5.gilan.nodes.deploymentproxy.Vnfd](#f5.gilan.nodes.deploymentproxy.Vnfd)
* [f5.gilan.nodes.deploymentproxy.Layer](#f5.gilan.nodes.deploymentproxy.Layer)
* [f5.gilan.nodes.CgnatRestConfig](#f5.gilan.nodes.CgnatRestConfig)
* [f5.gilan.nodes.RestConfig](#f5.gilan.nodes.RestConfig)
* [f5.gilan.nodes.RestConfigLoader](#f5.gilan.nodes.RestConfigLoader)
* [f5.gilan.nodes.BigIpState](#f5.gilan.nodes.BigIpState)
* [f5.gilan.nodes.ThresholdCalculator](#f5.gilan.nodes.ThresholdCalculator)
* [f5.gilan.nodes.NetworkMaskCalculator](#f5.gilan.nodes.NetworkMaskCalculator)
* [f5.gilan.nodes.NagiosRestMonitoring](#f5.gilan.nodes.NagiosRestMonitoring)
* [f5.gilan.nodes.ExternalDbDeploymentProxy](#f5.gilan.nodes.ExternalDbDeploymentProxy)

# Relationship types

* [f5.gilan.relationships.set_runtime_properties](#f5.gilan.relationships.set_runtime_properties)
* [f5.gilan.relationships.set_runtime_properties_to]($f5.gilan.relationships.set_runtime_properties_to)
* [f5.gilan.relationships.slave_connected_to_master](#f5.gilan.relationships.slave_connected_to_master)
* [f5.gilan.relationships.slave_connected_to_nsd](#f5.gilan.relationships.slave_connected_to_nsd)
* [f5.gilan.relationships.upgrade](#f5.gilan.relationships.upgrade)
* [f5.gilan.relationships.memberregistrar.load_from_config](#f5.gilan.relationships.memberregistrar.load_from_config)
* [f5.gilan.relationships.as3declaration.load_from_config](#f5.gilan.relationships.as3declaration.load_from_config)
* [f5.gilan.relationships.set_source_runtime_property_to_instance_id](#f5.gilan.relationships.set_source_runtime_property_to_instance_id)
* [f5.gilan.relationships.register_slave_to_arbiter](#f5.gilan.relationships.register_slave_to_arbiter)

## f5.gilan.nodes.ConnectionParameters

Transfer secrets between deployments.

### Properties

- **params** - data runtime property from the ``cloudify.nodes.secrets.Reader`` node.

## f5.gilan.nodes.CGNATvnfdProxy

A PROXY node used to execute workflow from another deployment.

## f5.gilan.nodes.CGNATAssigner

Manage and assign IP addresses when CGNAT is enabled.

## f5.gilan.nodes.CGNATConfiguration

Specify the IP ranges used by CGNAT mode.

### Parent type

``f5.gilan.nodes.DeploymentProxy``

### Properties

- **base_deployment_id** - Content of ``base_deployment_id``.
- **ip_ranges** - Array of IP ranges used by CGNAT mode. 
- **db_name** - PostgreSQL database name.
- **db_user** - Name of the PostgreSQL database user.
- **db_password** - Password of the PostgreSQL database user.
- **db_host** - Database hostname.
- **db_port** - Database port number.
- **db_sslmode** - SSL mode for connection with PostgreSQL database (enabled or disabled).
- **db_sslkey** - Specifies the location for the secret key used for the client certificate. Parameter is ignored, if an SSL connection is not made.
- **db_sslcert** - Specifies the file name of the client SSL certificate.
- **db_sslrootcert** - Specifies the name of a file containing SSL certificate authority (CA) certificate(s). If the file exists, the server's certificate is verified and then signed by one of these authorities.

 
### Interfaces

``f5.gilan.interfaces.lifecycle``

- **execute_proxy_tasks** - used for enabling CGNAT mode

## f5.gilan.nodes.RequestsHA

This node represents simple REST tasks with modified implementation.

## f5.gilan.nodes.IPManagerConfiguration

Node responsible for initializing pools of free IP addresses for specified networks in the database.

### Properties
- **deployment_id** - Content of base_deployment_id.
- **subnets** - Dictionary defining the key that specifies the name of the network and value representing the range of IPs to initialize. 
- **db_name** - PostgreSQL database name.
- **db_user** - Name of the PostgreSQL database user.
- **db_password** - Password of the PostgreSQL database user.
- **db_host** - Database hostname.
- **db_port** - Database port number.
- **db_sslmode** - SSL mode used for connecting with PostgreSQL database (enabled or disabled).
- **db_sslkey** - Specifies the location for the secret key used for the client certificate. Parameter is ignored, if an SSL connection is not made.
- **db_sslcert** - Specifies the file name of the client SSL certificate.
- **db_sslrootcert** - Specifies the name of a file containing SSL certificate authority (CA) certificate(s). If the file exists, the server's certificate is verified, and then signed by one of these authorities.

## f5.gilan.nodes.IPAssigner

Node responsible for initializing IP addresses for specified networks. Single IP address for specified networks available to use in different nodes.

### Properties

- **deployment_id** - Content of ``base_deployment_id``.
- **vlans** - Array of names of the networks from which we want to get unused IP addresses.
- **db_name** - PostgreSQL database name.
- **db_user** - Name of the PostgreSQL database user.
- **db_password** - Password of the PostgreSQL database user.
- **db_host** - Database hostname.
- **db_port** - Database port number.
- **db_sslmode** - SSL mode for connecting with PostgreSQL database (enabled or disabled).
- **db_sslkey** - Specifies the location for the secret key used for the client certificate.  Parameter is ignored, if an SSL connection is not made.
- **db_sslcert** - Specifies the file name of the client SSL certificate.
- **db_sslrootcert** - Specifies the name of a file containing SSL certificate authority (CA) certificate(s). If the file exists, the server's certificate is verified, and then signed by one of these authorities.

## f5.gilan.nodes.LSNArbiterPoller

F5 definition: *DEPRECATED*

## f5.gilan.nodes.LSNArbiterNode

F5 definition: *DEPRECATED*

## f5.gilan.nodes.ArbiterNode

Registers the slave BIG-IP instances. Used in the ``f5.gilan.relationships.register_slave_to_arbiter`` relationship.

## f5.gilan.nodes.InputValidator

Validates deployment input groups; for example, ``ip``, ``ip_range``, ``numbers``, ``multiple_selection``, ``time_special_case``, and ``custom_format``.   

## f5.gilan.nodes.OutputPoller

Used as a condition for waiting for different deployments.

### Properties

- **deployment_id** - Name of another deployment. 
- **poll_list** - List of dictionaries with information about waiting values.

### Interfaces

cloudify.interfaces.lifecycle:

- **configure** - Querying another deployment and waiting for information specified in node properties.

## f5.gilan.nodes.NagiosDeploymentID
Exposes Nagios deployment-related information to the model. 

### Properties

- **internal_gilan_id** - ``gilan_id`` of the main deployment.
- **external_gilan_id** - ``gilan_id`` of the base deployment, used only during while attaching to another deployment.

## f5.gilan.nodes.NagiosCertGenerator

Used to generate CSR according to the private RSA key (in PEM format).

### Properties

- **nagios_ip** - IP address of the Nagios virtual machine in the management network.

## f5.gilan.nodes.Id

Exposes deployment-related information to the model.

### Parent type

``cloudify.nodes.Root``

### Runtime properties
- **id** - Instance ID.
- **deployment_id** - Deployment ID for which the workflow execution is running.
- **blueprint_id** - Blueprint ID used to create the deployment for which the workflow execution is running.
- **uuid** - UUID created using ``uuid.uuid4()`` call.

## f5.gilan.nodes.SoftwareReference

Container for software version of the deployed VNF component and for version that will be used during the upgrade process.

### Parent type

``cloudify.nodes.Root``

### Properties

- **sw_ref** - Dictionary defining the following keys:
    - **data** - Dictionary with any data required for the VIM to instantiate the VNF component.
    - **revision** - Number to track versions of the ``sw_ref``.
- **upgrade_sw_ref** - Same as ``sw_ref``. Defines set of data used during the upgrade process; for example, next version that will be deployed.

### Runtime properties

- **sw_ref** - Initial copy of the ``sw_ref`` property. May change after running the Upgrade workflow. 
- **upgrade_sw_ref** - Initial copy of the ``sw_ref`` property. May change after running the Upgrade workflow. 

## f5.gilan.nodes.configuration.MemberRegistrar

Registers VNF member in the DA Group. It searches for deployments by the specified filter and calls workflow to register the VE (cluster slave) in DA Group VEs. The workflow executed on every DA Group NSD in this Service Layer is configuration_update.

### Parent type

``f5.gilan.nodes.DeploymentProxy``

### Properties

- **client** - Client configuration used, and if empty will reuse the manager client configuration.
    - **host** - Host of Cloudify's management machine.
    - **port** - Port of REST API service on management machine.
    - **protocol** - Protocol of REST API service on management machine. Default value is ``http``.
    - **api_version** - Version of REST API service on management machine.
    - **headers** - Headers you want added to the request.
    - **query_params** - Query parameters you want added to the request.
    - **cert**- Path to a copy of the server's self-signed certificate.
    - **trust_all** - If ``False``, the server's certificate (self-signed or not) will be verified.
    - **username** - Cloudify User username.
    - **password** - Cloudify User password.
    - **token** - Cloudify User token.
    - **tenant** - Cloudify Tenant name.
- **filter** - Filter deployments based on outputs values.
- **workflow_id** - Name of workflow to call.
- **workflow_params** - Requests params passed to the Requests plugin.
- **params** - Const params used by the ``cloudify-utilities-plugin`` and ``configuration_update`` during the Configuration Update workflow. 
- **params_list** - Parameters to pull using the ``cloudify-utilities-plugin`` and ``configuration_update`` from configuration loader. Default values include:
    - ``pool_member_enable``
    - ``pool_member_admin_state``
    - ``pool_member_service_port``
    - ``pool_member_server_addresses``
    - ``map_record_name``
    - ``map_record_data``

    
### Runtime properties

### Interfaces

``f5.gilan.interfaces.lifecycle``

- **disable** - Marks member as disabled by setting runtime property `disable` to **true**.

## f5.gilan.nodes.DeploymentProxy

Extends Cloudify's ``DeploymentProxy`` and provides additional features. It is a base type for all service layer components that are deployed using the deployment proxy. Sets the default value for log redirect feature to *false* (see the *cloudify.datatypes.DeploymentProxy* topic in the [Cloudify Deployment Proxy documentation][1]).

### Parent type

``cloudify.nodes.DeploymentProxy``

### Interfaces

``f5.gilan.interfaces.lifecycle``

Propagates the setting of ``state`` or ``adminState`` for the VEs. Subtypes may implement the lifecycle operations, if they deploy the VE that can apply the state change. The lifecycle operations include:

- **disable** - Sets state to disable.
- **enable** - Sets state to enable.
- **adminStateDisable** -  Sets ``adminState`` to disable.
- **adminStateEnable** - Sets ``adminState`` to enable.

See [F5 BIG-IP documentation] [3] for state description.

## f5.gilan.nodes.PortDefinition

Enables users to specify vnic-type when creating a neutron port. This node enables the use of SR-IOV ports in OpenStack: direct | direct-physical | macvtap | normal | baremetal | virtio-forwarder. Default value is *normal* for the following ports: mgmt_port, pdn_dag_port, pgw_dag_port, ha_port, ctrl_port, pgw_port, and pdn_port.

### Properties

- **vnic_binding_type** - Dictionary with specified names and types of ports.

## f5.gilan.nodes.deploymentproxy.Slave
Used to identify F5 BIG-IP cluster slaves inside a layer deployment required for running the Scaling and Healing worklfows.

### Parent type

``f5.gilan.nodes.DeploymentProxy``

## f5.gilan.nodes.deploymentproxy.Master

Used to identify F5 BIG-IP cluster master inside a layer deployment required for running the Scaling and Healing worklfows.

### Parent type

``f5.gilan.nodes.DeploymentProxy``

## f5.gilan.nodes.deploymentproxy.Nsd

Used to identify deployment that will create NSD for a given VE or cluster.

### Parent type

``f5.gilan.nodes.DeploymentProxy``

## f5.gilan.nodes.deploymentproxy.Vnfd

Used to identify deployment that will create VNFD for a given VE

### Parent type

``f5.gilan.nodes.DeploymentProxy``

## f5.gilan.nodes.deploymentproxy.Layer

Used to identify a deployment that will create a layer inside the VNF Group, in a Service Layer deployment.

### Parent type

``f5.gilan.nodes.DeploymentProxy``

### Interfaces

``f5.gilan.interfaces.lifecycle``

- **scale_out** - Used during the Scale-out workflow to scale the layer.

## f5.gilan.nodes.CgnatRestConfig

### Parent type

``cloudify.rest.Requests``

### Properties

 - **params_list** - Defines parameters to fetch from the configuration loader, during the Configuration Update workflow. See [cloudify-utilities-plugin and utilities_plugin] [2] for a description.
 - **params** - Defines read-only parameters. See [cloudify-utilities-plugin and utilities_plugin] [2] for a description.

### Interfaces

``cloudify.interfaces.lifecycle``

   Update:
   
   - **gilan.gilan_plugin.tasks.update_ltm**
       
       Inputs include:
       
       - **params** - parameters 
       - **template_file**
       - **is_alive** - required by cloudify-utilities-plugin. Not used by F5.

``f5.gilan.interfaces.lifecycle``

 **gilan.gilan_plugin.cgnat_ip_management.update_ltm_on_cgnat**

## f5.gilan.nodes.RestConfig

Pushes configuration to the BIG-IP VE. Uses the behavior of the cloudify.rest.Requests defined in ``cloudify-utilities.plugin`` (see the [Example Blueprint with REST Call] [4] for details).

### Parent type

``cloudify.rest.Requests``

### Properties

 - **params_list** - Defines parms to fetch from configuration loader during the Configuration Update workflow. See cloudify-utilities-plugin utilities_plugin for description.
 - **params** - Defines read-only params. See [cloudify-utilities-plugin and utilities_plugin] [2] for description.

### Runtime properties

Runtime properties you want set are defined by the params_list property.

- **cgnat_enabled** - TODO


### Interfaces

``cloudify.interfaces.lifecycle``

- **update** - Pushes the updated AS3 configuration to the host defined in ``params.big_ip_as3_host``. If ``cgnat_enabled runtme-property`` is defined and evaluates to *False*, then configuration is not pushed.
- **is_alive** - Required by ``cloudify-utilities-plugin``. Not used by F5.

## f5.gilan.nodes.RestConfigLoader

Implements the Configuration loader from ``cloudify-utilities-plugin cloudify_configuration``.

### Parent type

``configuration_loader``

### Properties
- **client** - Client configuration. If empty, will be reused by the manager client:
    - **host** - Host of Cloudify's management machine.
    - **port** - Port of REST API service on management machine.
    - **protocol** - Protocol of REST API service on management machine (default value is ``http``).
    - **api_version** -  Version of REST API service on management machine.
    - **headers** -  Headers you want added to the request.
    - **query_params** -  Query parameters you want added to the request.
    - **cert** - Path to a copy of the server's self-signed certificate.
    - **trust_all** -  If set to `False`, then the server's certificate (self-signed or not) is verified.
    - **username** - Cloudify User username.
    - **password** - Cloudify User password.
    - **token** - Cloudify User token.
    - **tenant** - Cloudify Tenant name.
- **filter** - Filter deployments based on outputs values. If the outputs match the filter provided, then the target deployment outputs are used to define pool members and map records, which are stored in the ``runtime_properties`` of this node instance.

### Runtime properties

- **pool_members** - List created from output named ``pool_memeber`` created based on the filter property.
- **map_records** - List created from output ``map_record`` created based on filter property.

## f5.gilan.nodes.BigIpState

Tracks BIG-IP state and allows to check for state before the Heal workflow is executed. This suppresses the heal operation in the case when BIG-IP is operational, but another VE sends an SNMP trap.

### Parent type

``configuration_loader``

### Properties

- **host** - AS3 service host address.
- **port** - AS3 service host number. When -1, then the default ports are used (80 for ssl = false and 443 for ssl = true).
- **ssl** - AS3 service protocol; either, ``http`` or ``https``.
- **verify** - A Boolean value, which controls whether F5 verifies the server's TLS certificate of the AS3 service.
- **template_file** - AS3 service YAML template file used to fetch the master node's status.
- **username** - AS3 service username.
- **password** - AS3 service password.
- **device_name** - AS3 device name.
- **parameters_json** - JSON passed to the template.
- 
### Runtime properties

- **scalable_entity_counter** - Use to track the number of slaves comprising the cluster slave nodes.
- **failover_state** - Failover state fetched from the AS3 service. Stored by the ``update_failover_state`` lifecycle operation.

### Interfaces

``f5.gilan.interfaces.lifecycl``

- **disable** - Mrks this instance as disabled by setting the runtime property disabled to *true*.
- **update_failover_state** - Fetches the failover state of the BIG-IP node. 
- **update_scalable_entity_counter** - Updates the ``runtime_property scalable_entity_counter``. Used in the layer Scale-out and Scale-in workflows.
 
## f5.gilan.nodes.ThresholdCalculator

Calculates threshold values used to configure Nagios monitoring, based on group throughput and group throughput-threshold.

### Parent type

``cloudify.nodes.Root``

### Properties

- **vnf_group_throughput** - The desired aggregate throughput (in Gigabits In/Out) for every layer in the group. Example values include: 5 for 5 gig, 10 for 10 gig, 0.5 for 500mb.
- **vnf_group_throughput_threshold** - New layer is added to group when the percentage of the average aggregate layer throughput exceeds this value (for example, 75).

### Runtime properties

- **vnf_group_throughput_threshold** - Calculated using the node properties and the following formula: vnf_group_throughput * vnf_group_throughput_threshold / 100. This value is normalized for Nagios and expressed in bytes.

## f5.gilan.nodes.NetworkMaskCalculator

Calculates the mask based on the network prefix.

### Parent type

``cloudify.nodes.Root``

### Properties

- **cidr** - CIDR definition input.

### Runtime properties

- **mask** - Netmask length taken from CIDR (for example, 24).
- **mask_bits** - Netmask in bit notation.

## f5.gilan.nodes.NagiosRestMonitoring

Configures an instance with specified IP address you want monitored by Nagios.

### Parent type

``cloudify.nodes.Root``

### Properties

- **nagiosrest_monitoring** - Nagios REST monitoring configuration. See [cloudify-managed-nagios-plugin] [5] for details.
- **ip** - IP address of instance you want monitored.
 
### Runtime properties

### Interfaces

``f5.gilan.interfaces.lifecycle``

 - **disable** - Removes monitoring configuration for this instance from Nagios.

## f5.gilan.nodes.ExternalDbDeploymentProxy

Deploys External database deployment that creates a PostgresSQL database for Cloudify plugins to use for storing information. Standard ``DeploymentProxy`` operations are used with three major modifications:

1. Installation guard condition used to determine if the installation of the deployment should proceed. This is used to create a configuration where a user provides an already existing host. The db_endpoint values are copied to runtime properties.
2. Create and configure operations, and search for the blueprint and deployment defined by a secret. If found, then it is used.
3. Deployment is not uninstalled, because database is a shared resource.

### Parent type

``cloudify.nodes.DeploymentProxy``

### Properties

- **installation_guard_condition** - If the provided value evaluates to false, then the lifecycle operations will continue to execute. Evaluation is done using a Python if-statement.
- **db_endpoint** - External database endpoint data, including:
    - **host** - Database host.
    - **name** - Database name.
    - **user** - Username used to connect to the database.
    - **password**- Password used to connect to the database.
    - **port** - Port on which the database service is running.
    - **sslkey** - CA key used for authentication in PostgreSQL database.
    - **sslcert** - CA certificate used for authentication in PostgreSQL database.
    - **sslrootcert** - CA root certificate used for authentication in PostgreSQL database.

### Runtime properties

- **host**- Database host.
- **name** - Database name.
- **user** - Username used to connect to the database.
- **password** - Password used to connect to the database.
- **port** - Port on which the database service is running.
- **sslkey** - CA key used for authentication in PostgreSQL database.
- **sslcert** - CA certificate used for authentication in PostgreSQL database.
- **sslrootcert** - CA root certificate used for authentication in PostgreSQL database.


# Relationships

## f5.gilan.relationships.set_runtime_properties

Sets runtime properties, provided in the input section, on the source node instance.

### Parent type

``cloudify.relationships.depends_on``

### Source interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:

 - **gilan.gilan_plugin.relationships.set_runtime_properties**
    
   Inputs include:
   
   - **runtime_properties** - List of runtime property dictionaries (name and value) you want set in the source node instance.


## f5.gilan.relationships.set_runtime_properties_to

Sets runtime properties, provided in the input section, on the target node instance.

### Parent type

``cloudify.relationships.depends_on``

### Source interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:

 - **gilan.gilan_plugin.relationships.set_runtime_properties_to**
    
   Inputs:
   
   - **runtime_properties** - List of runtime property dictionaries (name and value) you want set in the target node instance.

## f5.gilan.relationships.slave_connected_to_master

Used to emphasize slave-to-master relationship type between nodes, during layer Scale-out workflow, and to check if the target master node is not disabled. If disabled, then the slave will not perform install lifecycle operations.

### Parent type

``f5.gilan.relationships.set_runtime_properties``

## f5.gilan.relationships.slave_connected_to_nsd

Used to emphasize slave-to-nsd relationship type between nodes.

### Parent type

``f5.gilan.relationships.set_runtime_properties``

## f5.gilan.relationships.upgrade

Provided with both current and new software reference as inputs. Used to perform a software upgrade.

### Parent type

``cloudify.relationships.depends_on``

### Source interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:

- **gilan.gilan_plugin.relationships.upgrade** - Checks if the workflow is an Upgrade workflow. If so, sets the new software reference to the upgraded value.
    
    Inputs include:
    
    - **sw_ref** - Current software reference
    - **upgrade_sw_ref** - new software reference

## f5.gilan.relationships.memberregistrar.load_from_config

Loads configuration from target node to runtime properties. Used to prepare MemberRegistrar instance to register the active VE instance (for example the healed instance) in DA Group.

### Parent type

``load_from_config``

### Target interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:
- **gilan.gilan_plugin.relationships.load_from_config**
   
   Inputs include:
   
   - **source_config** - Parameters from target node to set in runtime properties.
   - **disabled** - If this parameter is false or empty, configuration is not updated. 

## f5.gilan.relationships.as3declaration.load_from_config

Used to add and/or remove any items to/from a configuration, and then load the new configuration to runtime properties.

### Parent type

``load_from_config``

### Target interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:
- **gilan.gilan_plugin.relationships.update_list_and_load_from_config**
   
   Inputs include:
   
   - **params** - Parameters you want loaded and saved in runtime properties.
   - **remove_items** - list of dictionaries of items to remove from configuration.
   - **add_items** - list of dictionaries of items to add to configuration.

   Both ``add_items`` and ``remove_items`` must contain a list of dictionaries with following items: ``value``, ``runtime_property``, ``compare_key``, and ``ignore_failure``.

## f5.gilan.relationships.set_source_runtime_property_to_instance_id

Saves source node's instance ID into runtime property.

### Parent type

``cloudify.relationships.depends_on``

### Source interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:

- **gilan.gilan_plugin.relationships.set_source_runtime_property_to_instance_id**
      
   Inputs:
   
   - **runtime_property** - Name of runtime_property in which to store instance ID.

## f5.gilan.relationships.register_slave_to_arbiter

Relationship used to add a slave to arbiter, finish, and remove a slave from arbiter when slave is set for deletion.

### Parent type

``cloudify.relationships.depends_on``

### Target interfaces

``cloudify.interfaces.relationship_lifecycle``

preconfigure:

- **gilan.gilan_plugin.slave_cluster_arbiter.start_slave** - Adds requested slave deployment to the arbiter.
   
   Inputs include:
   
   - **slave_deployment_id** - ID of the slave deployment.

   Establish:
 
   - **gilan.gilan_plugin.slave_cluster_arbiter.finish_slave** - Finishes requested slave deployment and removes it from the arbiter. Then, selects and enables a new slave to start clustering.
    Inputs:
    
    - **slave_deployment_id** - ID of the slave deployment

   Unlink:
 
   - **gilan.gilan_plugin.slave_cluster_arbiter.remove_slave** - Deletes the slave deployment with requested slave_deployment_id.
    
   Inputs include:
   
   - **slave_deployment_id** - ID of the slave deployment.
    
    
[1]: https://docs.cloudify.co/5.0.5/working_with/official_plugins/configuration/utilities/deploymentproxy/
[2]: https://docs.cloudify.co/5.0.5/working_with/official_plugins/configuration/utilities/
[3]: https://techdocs.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-basics-13-0-0/5.html
[4]: https://docs.cloudify.co/5.0.5/working_with/official_plugins/#example-blueprint-with-rest-call
[5]: https://docs.cloudify.co/5.0.5/developer/blueprints/spec-plugins/#managed-plugins