## Inputs for VNFM version 1.2.1

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API. The inputs for this version of VNFM are new or changed: 

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Newton 10)     | inputs_openstack_bigiq_v1.2.1.yaml           | F5-VNF-BIG-IQ_v1.2.1           |
| OpenStack (Newton 10)     | inputs_openstack_bigiq_v1.2.1.json           |                                |
| VMware vSphere ESXi 6.5   | inputs_vsphere_bigiq_v1.2.1.yaml             | vSphere-F5-VNF-BIG-IQ_v1.2.1   |
| VMware vSphere ESXi 6.5   | inputs_vsphere_bigiq_v1.2.1.json             |                                |
 

<!--- CGNAT capabilities - enable CGNAT using pre-provisioned LSN pools, a CGNAT-enabled AS3 declaration, and a Gi LAN or Gi Firewall blueprint solution defined with new CGNAT-specific inputs. --->

#### IMPORTANT:
-----------------
The bigip_os_ssh_key input has changed to **bigip_ssh_key** to be VIM agnostic, requiring you to update the following inputs files:

- Gi LAN
- Gi Firewall
- VNFM Base

----------------

For complete set up instructions, see the [product documentation](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#set-up-your-vim).

#### Copyright
Copyright 2014-2020 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.

