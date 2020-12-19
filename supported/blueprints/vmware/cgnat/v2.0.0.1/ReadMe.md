## About the vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v2.0.0.1 solution blueprint

This release provides the following fixes ONLY for known issues, and is used with the f5-gilan-plugin_0.2.54 version ONLY: 

* The **Update declaration** workflow is now synchronizing across all VEs in the VNF layer, as the AS3 declaration is sent to the Primary node, and
then propagated to the secondary nodes using sync only. Also added verification ``Declaration result: success`` messaging, when the AS3 declaration is accepted by the AS3 API.
* For GiLAN or Gi Firewall + CGNAT deployments, you can now change the CGNAT configuration, post deployment. For example, if you want to add a firewall rule on your CGNAT-enabled Gi Firewall, it will update the AS3 declaration, and then will replace the previously defined NAT pool addresses for the updated node. This occurs on each secondary node sequentially, without triggering a config sync.
* Now, the declaration update occurs only for the declaration type you selected, not for all types.
* After an update AS3 configuration workflow completes successfully, the update workflow will update the deployment inputs on the NSD layer, the VNF group, the VNF layer, and the main deployment. Therefore, when running future scale out and heal workflows that add new nodes, those new nodes will have the latest configuration.
* The telemetry as3 declaration now propagates after executing sync-to-device group.


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

#### Copyright
Copyright 2014-2021 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
