
## About F5 Gilan Plugin version 0.2.53
Changes to this plugin include support for the following: 

* **DNS blueprint** - General release of the standalone F5 DNS solution blueprint that queries and translates names for client requests. This DNS solution translates top-level Internet domains, such as .com, .net, .gov, .edu, and .org.
* **Secure DNS blueprint** - A single-purpose Secure-DNS blueprint, specifically designed to clean DNS queries. This security solution also includes a Standalone DNS service layer. 
* **Support for OpenStack without DHCP** - You can now provision F5 VNF Manager and deploy Gi LAN, Firewall, and Base blueprints in your OpenStack VIM that is implemented without DHCP. However, to deploy a BIG-IQ blueprint without DHCP, you must disable security groups for the VNFM MGMT port. To disable security groups, use the CLI command, ``openstack port set --disable-port-security <ID>``.
* **VNF-BIG-IQ support for VMware Integrated OpenStack (VIO)** - You can deploy the BIG-IQ blueprint solution in a |bigiqVIO_releaseNotes| environment. If the OpenStack/VIO API does not set the MTU value for your management network, then VNF Manager will use 1400 as the default value for VNF-BIG-IQ blueprint deployments ONLY.
* **The ``security_groups`` input for VNF-BIG-IQ blueprint** - Set the ``security_groups`` input for the VNF-BIG-IQ blueprint solution ONLY to a number value that /disables security groups. Setting this value to 1 (default value), enables the appropriate security groups for the BIG-IQ solution. Setting this value to 0, disables the default security group created by OpenStack for the BIG-IQ instance, as well as all other security groups that may exist. Allowed values include: 0 (disable), 1 (enable).
* **Support deployment to multiple VIMs (multi-VIM or -hypervisor)** - You can use one VNFM manager cluster provisioned in a VMware/OpenStack hypervisor that deploys solutions to other VMware or OpenStack hypervisors. This setup requires a new datacenter input defined for all blueprint solutions. Regardless of which VIM you use, you will now see blueprints for both OpenStack and VMware on the VNFM dashboard. Consult the mixed-VIM setup for complete system requirements. 
* **VNF-BIG-IQ prepare support for VMware Integrated OpenStack (VIO)** - Updated the BIG-IQ blueprint solution in preparation for the support of a |bigiqVIO_releaseNotes| environment. If the OpenStack/VIO API does not set the MTU value for your management network, then VNF Manager will use 1400 as the default value for VNF-BIG-IQ blueprint deployments ONLY.
* **F5-VNF-Service-Layer-CGNAT-Offering blueprint solution** - New blueprint solution used to implement CGNAT VNFs in environments with VNFs homed on different networks, not connected to DAG layers, but instead connected to the packet gateway and the provider network. - 
* **New syslog_config input** - Added new syslog_config input that attaches an additional BIG-IP VE syslog configuration file. Define this input when using ANY VNF blueprint solution (EXCEPT the VNF Base solution).
* **Logs menu** - Logs menu enables you to analyse events/logs produced by your deployments. Provides several event log and resource filtering options.

 
This version is used for deploying the following blueprint versions:

   - v1.4.X and later/F5-VNF-Service-Layer-Base
   - v1.4.X and later/F5-VNF-Service-Layer-GiLAN
   - v1.4.X and later/F5-VNF-Service-Layer-Firewall
   - v1.4.X and later/F5-VNF-Service-Layer-DNS
   - v1.4.X and later/F5-VNF-Service-Layer-DNS-Security
   - v2.0.0 and later/F5-VNF-Service-Layer-CGNAT

### To upgrade plugins

1. [Upload new plugin version to your VNF Manager](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/plugins#manually-upload-plugins-to-vnf-manager). 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.

#### Copyright
Copyright 2014-2020 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.