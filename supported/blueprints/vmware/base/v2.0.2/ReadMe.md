## About the vSphere-F5-VNF-Service-Layer-Base_v2.0.2 solution blueprint


This release provides the following fixes for known issues and preview functionlality changes. Use with the f5-gilan-plugin_2.0.2 version ONLY: 


* Bug fixes:   

  * Running the Heal and Purge workflows for VNF layers no longer causes the slave node to fail in VMware Vsphere environment and executes as expected in both OpenStack and VMware.
  * Fixed the controller task, so you no longer get the Task failed ``cloudify_vsphere.devices.create_contoller`` -> ``cloudify_vsphere.devices`` has no function named ``create_contoller`` error in Vsphere.
  * Socket no longer hangs causing an error; therefore, AS3 no longer fails to start.
  * The ``default_page_size`` limit is now 20000 to accommodate scaling large deployments with a high number of node-instances.
  * VNFM components are syncing as expected with the internal VNFM NTP service.
  * The default naming convention used for all BIG-IP VEs is no longer preassigned with an environment prefix; for example, openstacklocal hostnames. The hostname uses a generic naming convention.
  * You no longer receive a permissions error when taking a snapshot for restoring OpenStack and vSphere images (found after running a series of automated tests). Taking a snapshot works as designed. See the Backup and restore guide for details.
  * When installing a Gi-LAN+CGNAT blueprint, the Heal workflow no longer fails with an ``UnboundLocalError: local variable check_sync_status_id`` referenced before assignment error message.
  * The CGNAT-Offering blueprint solution for vSphere are now advertising the BGP prefixes, as designed, and is persisting the correct NIC order.
  * NIC ordering fix for vSphere no longer causes the Client action _upload failed error in OpenStack.
  * When deploying the CGNAT-Offering blueprint, two Control NICs are no longer created unintentionally. Only one Control NIC is created.
  * When executing the Configuration update workflow on vSphere GiLAN (non-CGNAT) deployments, you no longer get an error on the additional NSD layers.
  * Updated the inputs_openstack_base.yaml inputs file correcting (swapping) the example values for ``external_sg_name`` (correct value is ``pdn_sg``) and ``internal_sg_name`` (correct value is ``pgw_sg``) inputs.
  * The Heal workflow executed on a DAG VE, now triggers consistently as designed.
  * The Base blueprint solution no longer fails in vSphere with a TypeError on LTM group installation.
  * Cloud-libs no longer results in errors like MCP unavailable and ECONNRESET.
  * Revised the Backup and restore process with new procedures that restore snapshots of F5 VNF Manager version 2.0.2.
  * CGNAT-Offering and Base blueprint solutions for OpenStack no longer return an invalid blueprint error.
  * Broadened the rabbitmq-key.pem privileges, enabling you to create VNFM snapshots without errors or failures (see the Backup and restore guide).
  * When the Heal workflow is running on VNF layer the ``synchronize_layer`` task no longer attempts to sync with wrong master.


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

#### Copyright
Copyright 2014-2023 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
