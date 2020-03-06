## About the F5-VNF-Service-Layer-GiLAN_v1.3.0 solution blueprint
This version contains the following changes:

* New security_groups input to enable/disable any security groups added and the default security group created by OpenStack for all instances.
* The floating_IP input is now optional for verison 1.3.0 and later and the default value is empty for VNFM projects in OpenStack ONLY. 
* Tested and verified compatibility with OpenStack Queens version 13.
* Enabling CGNAT capability.
* Enhanced VNFM event logs.

Due to the changes added for enabling CGNAT, there are now two different blueprints:

* F5-VNF-Service-Layer-GiLAN - OpenStack VIMS
* vSphere-F5-VNF-Service-Layer-GiLAN - VMware vSphere VIM

#### Copyright
Copyright 2014-2020 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
