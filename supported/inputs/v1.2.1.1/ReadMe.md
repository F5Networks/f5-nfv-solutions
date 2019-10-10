## Inputs for VNFM version 1.2.1.1

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API. The inputs for this version of VNFM are new or changed for OpenStack VIM and the Gi LAN and Gi Firewall blueprint solutions ONLY: 

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Newton 10)     | inputs_openstack_base_v1.2.1.1.yaml<br>inputs_openstack_base_v1.2.1.1.json <br> inputs_openstack_firewall_v1.2.1.1.yaml <br>  inputs_openstack_firewall_v1.2.1.1.json <br> inputs_openstack_gilan_v1.2.1.1.json <br> inputs_openstack_gilan_v1.2.1.1.yaml <br><br> **IMPORTANT:** The [VNFM-BIG-IQ blueprint][6] solution did NOT change for this release. Use the [1.2.1 version][7] input files.| F5-VNF-Service-Layer-Base_v1.2.1.1 <br> F5-VNF-Service-Layer-GiLAN_v1.2.1.1 <br> F5-VNF-Service-Layer-Firewall_v1.2.1.1|
| VMware vSphere ESXi 6.5   | No new inputs files for this release. Use version [1.2.1][1]. | F5-VNF-Service-Layer-GiLAN_v1.2.1 <br> F5-VNF-Service-Layer-Firewall_v1.2.1 <br> F5-VNF-Service-Layer-Base_v1.2.1 <br> F5-VNF-BIG-IQ_v1.2.1 |
 

### What's new

* **Security groups are optional**--for OpenStack VIM. New security_groups input for Gi LAN and Gi Firewall inputs file that enables/disables security groups including the default security group created by Openstack for all instances.
* **floating_network_id input**--for OpenStack VIM is now OPTIONAL.


#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.



[1]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/inputs/v1.2.1/VMware
[2]: https://github.com/F5Networks/f5-nfv-solutions/blob/master/supported/inputs/v1.2.1/OpenStack/inputs_openstack_base_v1.2.1.yaml
[3]: https://github.com/F5Networks/f5-nfv-solutions/blob/master/supported/inputs/v1.2.1/OpenStack/inputs_openstack_bigiq_v1.2.1.yaml
[4]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/inputs/v1.2.1/OpenStack
[5]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/blueprints/base/v1.2.1
[6]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/blueprints/big-iq/v1.2.1
[7]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/inputs/v1.2.1/OpenStack
