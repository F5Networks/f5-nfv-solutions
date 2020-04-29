## About the F5-VNF-Service-Layer-CGNAT-Offering_v2.0.0 solution blueprint

This version contains support for following new features:

* **Support deployment to multiple VIMs (multi-VIM or -hypervisor)** - You can use one VNFM manager cluster provisioned in a VMware/OpenStack hypervisor that deploys solutions to other VMware or OpenStack hypervisors. This setup requires a new datacenter input defined for all blueprint solutions. Regardless of which VIM you use, you will now see blueprints for both OpenStack and VMware on the VNFM dashboard. Consult the mixed-VIM setup for complete system requirements. 
* **VNF-BIG-IQ prepare support for VMware Integrated OpenStack (VIO)** - Updated the BIG-IQ blueprint solution in preparation for the support of a |bigiqVIO_releaseNotes| environment. If the OpenStack/VIO API does not set the MTU value for your management network, then VNF Manager will use 1400 as the default value for VNF-BIG-IQ blueprint deployments ONLY.
* **F5-VNF-Service-Layer-CGNAT-Offering blueprint solution** - New blueprint solution used to implement CGNAT VNFs in environments with VNFs homed on different networks, not connected to DAG layers, but instead connected to the packet gateway and the provider network.



Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

#### Copyright
Copyright 2014-2020 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
