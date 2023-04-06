## Use F5 RIC Plugin 3.0.0 
This is the 3.0.0 version of the Resource Information Collector plugin, enabling utility resource collection and usage report generation for the following deployed blueprints:
 
 - Gi LAN version 1.4.X and later
 - Gi Firewall 1.4.X and later
 - Standalone DNS 1.4.X and later
 - DNS Security v1.4.X and later
 - Secure DNS 1.4.X and later
 - CGNAT Offering 2.0.X and later
 - CGNAT 2.0.X and later

Changes to the F5 RIC plugin include: 

- Pipeline-built image improvements
- Centos bug fixes
- Grammatical typo fixes

Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.

### To upgrade plugins

1. [Upload new plugin version to your VNF Manager](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/plugins#manually-upload-plugins-to-vnf-manager). 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.


#### Copyright
Copyright 2014-2022 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
