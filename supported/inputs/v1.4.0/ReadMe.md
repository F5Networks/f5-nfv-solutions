## Inputs for VNFM version 1.4.01.4.0

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API.  

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Newton 10) <br>  OpenStack (Queens 13)   | inputs_openstack_bigiq_v1.4.0.yaml<br>inputs_openstack_bigiq_v1.4.0.json<br>inputs_openstack_base_v1.4.0.yaml<br>inputs_openstack_base_v1.4.0.json <br> inputs_openstack_firewall_v1.4.0.yaml <br>  inputs_openstack_firewall_v1.4.0.json <br> inputs_openstack_gilan_v1.4.0.json <br> inputs_openstack_gilan_v1.4.0.yaml <br> inputs_openstack_dns_v1.4.0.yaml<br> inputs_openstack_dns_security_v1.4.0.yaml<br><br>| F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v1.4.0  <br> F5-VNF-Service-Layer-Firewall_v1.4.0<br> F5-VNF-Service-Layer-GiLAN_v1.4.0<br> F5-VNF-Service-Layer-DNS_v1.4.0<br> F5-VNF-Service-Layer-DNS_Security_v1.4.0|
| VMware vSphere ESXi 6.5   | inputs_vsphere_base_v1.3.yaml<br>inputs_vsphere_base_v1.3.json<br>inputs_vsphere_bigiq_v1.3.yaml<br>inputs_vsphere_bigiq_v1.4.0.json<br>inputs_vsphere_firewall_v1.4.0.yaml<br>inputs_vsphere_firewall_v1.4.0.json<br>inputs_vsphere_gilan_v1.4.0.yaml<br>inputs_vsphere_gilan_v1.4.0.json<br>inputs_vsphere_dns_v1.4.0.json<br>inputs_vsphere_dns_securityv1.4.0.json  | F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v1.4.0  <br> vSphere-F5-VNF-Service-Layer-Firewall_v1.4.0<br> vSphere-F5-VNF-Service-Layer-GiLAN_v1.4.0<br> vSphere-F5-VNF-Service-Layer-DNS_v1.4.0<br> vSphere-F5-VNF-Service-Layer-DNS-Security_v1.4.0 |
 

### What's new

This version contains support for following new features:

* **DNS blueprint** - Tested and release-ready version of the standalone F5 DNS solution blueprint that queries and translates names for client requests. This DNS solution translates top-level Internet domains, such as .com, .net, .gov, .edu, and .org.
* **DNS Security VNF Service** - A single-purpose, DNS Security VNF Service blueprint, specifically designed to clean DNS queries. This security solution also includes a Standalone DNS service layer.
* **Support for OpenStack without DHCP** - You can now provision F5 VNF Manager and deploy Gi LAN, Firewall, and Base blueprints in your OpenStack VIM that is implemented without DHCP. However, to deploy a BIG-IQ blueprint without DHCP, you must disable security groups for the VNFM MGMT port. To disable security groups, use the CLI command, ``openstack port set``.
* **The ``security_groups`` input for VNF-BIG-IQ blueprint** - Set the ``security_groups`` input for the VNF-BIG-IQ blueprint solution ONLY to a number value that enables/disables security groups. Setting this value to 1 (default value), enables the appropriate security groups for the BIG-IQ solution. Setting this value to 0, disables the default security group created by OpenStack for the BIG-IQ instance, as well as all other security groups that may exist. Allowed values include: 0 (disable), 1 (enable).
* **Updated the ric_plugin** - A new ric_plugin version 0.5 generates usage reporting for the DNS and DNS Security VNF Service blueprints.
* **Blueprint solutions deployed in a dark environment** - You can now deploy Gi LAN and Gi Firewall in a dark environment (without connection to the Internet).


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.



#### Copyright
Copyright 2014-2020 F5 Networks Inc.

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
