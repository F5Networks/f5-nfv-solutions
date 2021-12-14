## About the F5-VNF-BIG-IQ_v2.0.0.1 solution blueprint

This release provides the following fixes for known issues and preview functionlality changes. Use with the f5-bigiq-plugin_0.1 version ONLY: 


* Bug fixes:   

  * Scale in workflow works as expected on DNS SEC Layer.
  * Changed the 1-year certificate expiration to a 10-year expiration. VNFM manager works as expected, and no longer becomes unresponsive after 365 days.
  * After running the Purge workflow a member node is now removed from the DAG, as designed.
  * DAG vnf_pool is now updated after running the Scale in workflow on the vnf_group deployment.
  * The CGNAT Offering blueprint works as expected.
  * The enable_cgnat_on_single_nsd_deployment workflow operates as expected.
  * GiLAN blueprint solution no longer fails while installing one slave.
  * Zooming the map view in the new Site Management widget now works as expected.
  * Input parameter vnic_binding_type description updated with more clarity.
  * The Heal workflow for a VNF layer runs successfully without failing due to a dictionary size change.
  * BIG-IQ Blueprint installs successfully, and no longer tries to retrieve inputs from an external database.
  * Updated PyYAML to 5.4.1 and resolved a security vulnerability.
  * Updated cloudlibs to v4.23.1 and fixed a security vulnerability with the lodash.js file.
  * Resolved the incorrect CGNAT IP addresses on healed instances.
  * Base blueprint installs successfully as design without a AS3 rpm install failure.
  * When deploying the vSphere-F5-VNF-Service-Layer-Firewall blueprint, you no longer get a, “Task failed ‘gilan_plugin.tasks.ha_rest_wrapper’ -> 404 Client Error: Not Found for url” error message.
  * When installing deployment from vSphere-F5-VNF-Service-Layer-Firewall blueprint, you no longer get a “Nagios internal server error 500” message.
  * When installing the DNS SEC in blueprint, the deployment runs successfully as designed, without runtime errors while trying to run proxy task upload_blueprint command.
  * In OpenStack the DNS SEC blueprint installs successfully, and no longer fails due to CGNAT code.
  * In vSphere the GiLAN blueprint installs successfully without a conflicting SNMP URL.
  * DNS and DNS SEC blueprint installations no longer fail in vSphere due to a runtime error.
  * Blueprint installations no longer randomly times out due to a restjavad problems.
  * For the DNS and DNS SEC blueprints, the Scale Out workflow runs successfully, as designed.
  * You no longer get an “UnboundLocalError” message, when running the Heal workflow, on the Firewall blueprint with CGNAT inputs defined.
  * Open port in Nagios server (port 111) is rpcbind, and is now fire-walled off.
  * You can now restore a snapshot (with the exception of VNFM 2.0.0), and you will no longer encounter the following error: “Restoring snapshot from version 0.0.0 is not supported.” Be aware, you may need to make repeated attempts at a snapshot before success.
  * The Upgrade workflow no longer automatically admin-disables the old layer. Perform this step manually, as designed.
  * The Heal workflow no longer returns an error on the vnf_layer for Gi LAN blueprint deployments.
  * The telemetry AS3 declaration now propagates as expected, after executing sync-to-device group.
  * You will no longer receive a 404 error message when trying to deploy any blueprint on vSphere VIM with a setting of switch_distributed=False.
  * Device configuration groups now sync with the master node after executing a Scale out workflow for a vnf_layer deployment.
  * New deployments created during a Scale out workflow or a Heal workflow are now created with updated inputs.
  * When you select one type of declaration (AS3, Telemetry Streaming, or Syslog), VNFM no longer triggers all three declaration types, during an update, and the declaration no longer breaks the configuration services on the VNFs.
  * VNFM now provides enough space to install all .rpm package types available on F5 Downloads site.
  * When launching the Gi LAN blueprint solution, the increment_ips_proxy workflow is now blocked when CGNAT is NOT enabled. This is the intended behavior.
  * Nagios installs successfully and no longer fails or freezes when reloading systemd configuration.
  * If you have not defined the vlan_ip_map key, you can now scale out resources without failure.
  * The Configuration Update workflow runs successfully as designed without an error in the NSD node-telemetry_declaration.
  * The Cloud-libs is no longer stuck on /tm/sys/available, and will no longer cause BIG-IP deployment failures on the node.
  * The Update declaration workflow now synchronizes across all VEs in the VNF layer; therefore, you no longer need to manually push the changes using a curl command.
  * For GiLAN or Gi Firewall + CGNAT deployments install successfully as designed, and you can now make changes to the CGNAT configuration, post deployment.
  * The blueprint wizard launched from the VNFM dashboard are branded with VNF Manager, as expected.
  * The CLI for license and site management is now VNFM-branded, as expected.
  * Corrected the assigned permissions level required for reading VNFM certificates.
  * BIG-IP VEs uninstall correctly in vSphere, and the execution and logs no longer stop at: main payload handler.
  * BIG-IQ blueprint in vSphere now checks for activation status of license offerings.
  * During the Uninstall workflow in a Multi-VIM environment, the registration node no longer encounters a RecoverableError and no longer fails to unregister one or more VE instances.
  * VNFD Purge workflow executes as expected, and no longer fails with a NoneType object has no attribute config error message.
  * VNFD Install workflow executes as expected and will no longer fail in OpenStack during the check_all_services with a No key error message.
  * Fixed the Upgrade workflow so DNS deployments no longer fail.
  * The ntpdate is no longer stuck during cloud-init execution.
  * Added a REST call for the MAC interface list to return a null value in order to get an accurate NIC ordering.
  * Removed Syslog code.
  * When uninstalling deployments, the Nagios VM is removed appropriately allowing for the workflow and logs to execute as intended.
  * AS3 declaration is now updated on healed instances by executing the Update declaration workflow as intended.
  * DNS SEC traffic flows as expected in an OpenStack environment.
  * When uninstalling one slave, the BIG-IP VE no longer hangs.
  * Running the Increment ip proxy workflow on a Gi-LAN + CGNAT deployment works as designed without a runtime error.
  * The Enable CGNAT workflow run on Gi-LAN blueprint now works as designed.
  * The Modify cgnat workflow no longer appears in the Execute Workflow menu. You cannot run this workflow manually.

* Functionality changes:

  * PREVIEW FEATURE: Supplemented all VNFM blueprint solutions with the new ``additional_commands`` input  for executing TMSH/BASH commands for configuration purposes. The default setting for this input is an empty list (of commands).
  * Added python-openstackclient 3.14.4, which is a command-line client tool for OpenStack Queens. You can execute the OpenStack command set from VNF Manager for Compute, Identity, Image, Network, Object Store, and Block Storage APIs.


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

#### Copyright
Copyright 2014-2022 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
