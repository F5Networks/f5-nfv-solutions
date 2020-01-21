## Inputs for VNFM version 1.3.1

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API.  

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Newton 10) <br>  OpenStack (Queens 13)   | inputs_openstack_bigiq_v1.3.1.yaml<br>inputs_openstack_bigiq_v1.3.1.json<br>inputs_openstack_base_v1.3.1.yaml<br>inputs_openstack_base_v1.3.1.json <br> inputs_openstack_firewall_v1.3.1.yaml <br>  inputs_openstack_firewall_v1.3.1.json <br> inputs_openstack_gilan_v1.3.1.json <br> inputs_openstack_gilan_v1.3.1.yaml <br> inputs_openstack_dns_v1.3.1.yaml<br> inputs_openstack_dns_security_v1.3.1.yaml<br><br>| F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v1.3.1  <br> F5-VNF-Service-Layer-Firewall_v1.3.1<br> F5-VNF-Service-Layer-GiLAN_v1.3.1<br> F5-VNF-Service-Layer-DNS_v1.3.1<br> F5-VNF-Service-Layer-DNS_Security_v1.3.1|
| VMware vSphere ESXi 6.5   | inputs_vsphere_base_v1.3.yaml<br>inputs_vsphere_base_v1.3.json<br>inputs_vsphere_bigiq_v1.3.yaml<br>inputs_vsphere_bigiq_v1.3.1.json<br>inputs_vsphere_firewall_v1.3.1.yaml<br>inputs_vsphere_firewall_v1.3.1.json<br>inputs_vsphere_gilan_v1.3.1.yaml<br>inputs_vsphere_gilan_v1.3.1.json<br>inputs_vsphere_dns_v1.3.1.json<br>inputs_vsphere_dns_security_v1.3.1.json  | F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v1.3.1  <br> vSphere-F5-VNF-Service-Layer-Firewall_v1.3.1<br> vSphere-F5-VNF-Service-Layer-GiLAN_v1.3.1<br> vSphere-F5-VNF-Service-Layer-DNS_v1.3.1<br> vSphere-F5-VNF-Service-Layer-DNS-Security_v1.3.1 |
 

### What's new

- **SR-IOV capability for OpenStack** - This release enables you to utilize the single root input/output virtualization (SR-IOV), isolating the PCI Express resources, so you can share the physical PCI Express resources in your virtual OpenStack environment. Consult |bigipvePrereqs_releaseNotes| for more information about configuring SR-IOV on the hypervisor.
- **DNS blueprint** - A standalone F5 DNS solution blueprint queries and translates names for client requests. This DNS solution translates top-level Internet domains, such as .com, /net, .gov, .edu, and .org.
- **DNS-Security blueprint** - A single-purpose DNS-Security blueprint, specifically designed to clean DNS queries. This security solution also includes a :ref:`Standalone DNS <setupDNSstndalone>` service layer.
- **Upgraded to AS3 extension v3.16.0**  -  The Gi LAN, Gi Firewall, DNS, DNS-Security, and all CGNAT-enabled blueprints now use an updated |as3_rns|. A sample AS3 declaration is included in the supported NFV solution inputs files on |NFV-github|.
- **Support a dark environment for NAGIOS** - You can now run F5 VNF Manager with a prebuilt Nagios image NOT connected to the Internet. You must upload the prebuilt Nagios image directly into your VIM environment instead of a CentOS image. Obtain this prebuilt Nagios image with your F5 VNF Manager purchase confirmation email.
- **Support deployment to multiple VIMs** - You can use one VNFM manager cluster provisioned in a VMware/OpenStack VIM that deploys solutions to other VMware or OpenStack VIMS. This setup requires a new ``datacenter`` input defined for all blueprint solutions.
- **Support for OpenStack without DHCP** - You can now provision F5 VNF Manager in your OpenStack VIM implemented without DHCP.
- **Support for BIG-IP VE 14.1.X** - You can now download BIG-IP VE 14.1.X for use with all F5 NFV Solutions.


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
