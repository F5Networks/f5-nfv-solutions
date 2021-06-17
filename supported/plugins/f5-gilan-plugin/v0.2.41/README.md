## Use f5-gilan-plugin-0.2.41 
This is the initial version deploying F5 Service Layer infrastructure of BIG-IPs. This plugin deploys the following blueprint versions:

- v1.1.0/F5-VNF-Service-Layer-Base
- v1.1.0/F5-VNF-Service-Layer-GiLAN
- v1.1.0/F5-VNF-Service-Layer-Firewall

### To upgrade plugins

1. [Upload new plugin version to your VNF Manager](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/plugins#manually-upload-plugins-to-vnf-manager). 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.


#### Copyright
Copyright 2014-2021 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
