## Inputs for VNFM version 1.3.0

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API. The inputs for this version of VNFM are new or changed for OpenStack VIM and the Gi LAN and Gi Firewall blueprint solutions ONLY: 

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Newton 10)     | inputs_openstack_bigiq_v1.3.0.yaml<br>inputs_openstack_bigiq_v1.3.0.json<br>inputs_openstack_base_v1.3.0.yaml<br>inputs_openstack_base_v1.3.0.json <br> inputs_openstack_firewall_v1.3.0.yaml <br>  inputs_openstack_firewall_v1.3.0.json <br> inputs_openstack_gilan_v1.3.0.json <br> inputs_openstack_gilan_v1.3.0.yaml <br><br>| F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v1.3.0  <br> F5-VNF-Service-Layer-Firewall_v1.3.0<br> F5-VNF-Service-Layer-GiLAN_v1.3.0|
| VMware vSphere ESXi 6.5   | Inputs for VMware vSphere implementaitons did not change for VNF Manager 1.3. Use the inputs released in version 1.2.1.  |Blueprints for VMware vSphere implementaitons did not change for VNF Manager 1.3. Use the blueprints released in version 1.2.1.  |
 

### What's new

* New security_groups input to enable/disable any security groups added and the default security group created by OpenStack for all instances.
* The floating_IP input is now optional for verison 1.2.2 and later and the default value is empty for VNFM projects in OpenStack ONLY. 
* Tested and verified compatibility with OpenStack Queens version 13.
* Enabling CGNAT capability.
* Enhanced VNFM event logs.


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
