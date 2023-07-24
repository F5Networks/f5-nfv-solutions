## Inputs for VNFM version 4.0.0

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API.  

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Trains 16) <br>  OpenStack (Queens 13)   | inputs_openstack_bigiq_v4.0.0.yaml<br>inputs_openstack_bigiq_v4.0.0.json<br>inputs_openstack_base_v4.0.0.yaml<br>inputs_openstack_base_v4.0.0.json <br> inputs_openstack_firewall_v4.0.0.yaml <br>  inputs_openstack_firewall_v4.0.0.json <br> inputs_openstack_gilan_v4.0.0.json <br> inputs_openstack_gilan_v4.0.0.yaml <br> inputs_openstack_dns_v4.0.0.yaml<br> inputs_openstack_dns_security_v4.0.0.yaml<br>inputs_openstack_dns_security_v4.0.0.json<br>inputs_openstack_cgnat_v4.0.0.yaml<br>inputs_openstack_cgnat_v4.0.0.json<br>| F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v4.0.0  <br> F5-VNF-Service-Layer-Firewall_v4.0.0<br> F5-VNF-Service-Layer-GiLAN_v4.0.0<br> F5-VNF-Service-Layer-DNS_v4.0.0<br> F5-VNF-Service-Layer-DNS_Security_v4.0.0<br> F5-VNF-Service-Layer-CGNAT-Offering_v4.0.0|
| VMware vSphere ESXi 6.5-7.0.3   | inputs_vsphere_base_v1.3.yaml<br>inputs_vsphere_base_v1.3.json<br>inputs_vsphere_bigiq_v1.3.yaml<br>inputs_vsphere_bigiq_v4.0.0.json<br>inputs_vsphere_firewall_v4.0.0.yaml<br>inputs_vsphere_firewall_v4.0.0.json<br>inputs_vsphere_gilan_v4.0.0.yaml<br>inputs_vsphere_gilan_v4.0.0.json<br>inputs_vsphere_dns_v4.0.0.json<br>inputs_vsphere_dns_security_v4.0.0.json<br>inputs_vsphere_dns_security_v4.0.0.yaml<br>inputs_vsphere_cgnat_v4.0.0.json<br>inputs_vsphere_cgnat_v4.0.0.yaml  | vSphere-F5-VNF-BIG-IQ.yaml <br> vSphere-F5-VNF-Service-Layer-Base_v4.0.0  <br> vSphere-F5-VNF-Service-Layer-Firewall_v4.0.0<br> vSphere-F5-VNF-Service-Layer-GiLAN_v4.0.0<br> vSphere-F5-VNF-Service-Layer-DNS_v4.0.0<br> vSphere-F5-VNF-Service-Layer-DNS-Security_v4.0.0<br> vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v4.0.0.|
| VMware Cloud Director 10.3   | inputs_vcloud_gilan_cgnat.yaml<br>inputs_vcloud_gilan_cgnat.json<br>inputs_vcloud_cgnat_offering.yaml<br>inputs_vcloud_cgnat_offering.json | vCloud-F5-VNF-Service-Layer-GiLAN_v4.0.0<br>vCloud-F5-VNF-Service-Layer-CGNAT-Offering_v4.0.0


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

#### Copyright
Copyright 2014-2023 F5 Networks Inc.

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
