## About the F5-VNF-Service-Layer-GiLAN_v1.4.0 solution blueprint

This version contains support for following new features:

* **DNS blueprint** - Tested and release-ready version of the standalone F5 DNS solution blueprint that queries and translates names for client requests. This DNS solution translates top-level Internet domains, such as .com, .net, .gov, .edu, and .org.
* **DNS Security VNF Service** - A single-purpose, DNS Security VNF Service blueprint, specifically designed to clean DNS queries. This security solution also includes a Standalone DNS service layer.
* **Support for OpenStack without DHCP** - You can now provision F5 VNF Manager and deploy Gi LAN, Firewall, and Base blueprints in your OpenStack VIM that is implemented without DHCP. However, to deploy a BIG-IQ blueprint without DHCP, you must disable security groups for the VNFM MGMT port. To disable security groups, use the CLI command, ``openstack port set``.
* **The ``security_groups`` input for VNF-BIG-IQ blueprint** - Set the ``security_groups`` input for the VNF-BIG-IQ blueprint solution ONLY to a number value that enables/disables security groups. Setting this value to 1 (default value), enables the appropriate security groups for the BIG-IQ solution. Setting this value to 0, disables the default security group created by OpenStack for the BIG-IQ instance, as well as all other security groups that may exist. Allowed values include: 0 (disable), 1 (enable).
* **Updated the ric_plugin** - A new ric_plugin version 0.5 generates usage reporting for the DNS and DNS Security VNF Service blueprints.
* **Blueprint solutions deployed in a dark environment** - You can now deploy Gi LAN and Gi Firewall in a dark environment (without connection to the Internet).


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

#### Copyright
Copyright 2014-2022 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
