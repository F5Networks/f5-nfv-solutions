
## About the F5-VNF-Service-Layer-GiLAN_v1.3.1 solution blueprint

This version contains the following new features:

* **DNS blueprint PREVIEW** - A PREVIEW version of the standalone F5 DNS solution blueprint that queries and translates names for client requests. This DNS solution translates top-level Internet domains, such as .com, .net, .gov, .edu, and .org.
* **Upgraded to AS3 extension v3.16.0** - The Gi LAN, Gi Firewall, DNS-enabled, and CGNAT-enabled blueprints now use an updated F5 AS3 Extension. A sample AS3 declaration is included in the supported NFV solution inputs files on GitHub. 
* **Support a dark environment for Nagios** - You can now run F5 VNF Manager with a prebuilt Nagios image NOT connected to the Internet. You must upload the prebuilt Nagios image directly into your VIM environment instead of a CentOS image. Obtain this prebuilt Nagios image with your F5 VNF Manager purchase confirmation email.
* **Support deployment to multiple VIMs (multi-VIM or -hypervisor)** - You can use one VNFM manager cluster provisioned in a VMware/OpenStack hypervisor that deploys solutions to other VMware or OpenStack hypervisors. This setup requires a new datacenter input defined for all blueprint solutions. Regardless of which VIM you use, you will now see blueprints for both OpenStack and VMware on the VNFM dashboard.
* **Support for OpenStack without DHCP** - You can now provision F5 VNF Manager in your OpenStack VIM implemented without DHCP when NOT using security groups.
* **Support for BIG-IP VE 14.1.X** - You can now download BIG-IP VE 14.1.X for use with all F5 NFV solution blueprints.
* Management network MTU value (OpenStack) - If the OpenStack/VIO API does not set the MTU value for your management network, then VNF Manager will use 1500 as the default value.
* **Renamed and added secrets** - Renamed all existing VIM-specific secrets appending ``_default`` to distinguish the VNFM’s secret from other similar secrets added to accommodate multi-VIM configurations. Added two new OpenStack, keystone secrets; ``keystone_allow_insecure_default`` and ``keystone_ca_cert_default``.

#### Copyright
Copyright 2014-2020 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
