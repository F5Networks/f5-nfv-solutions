## Use F5 BIG-IQ Plugin 3.0.0 
The F5 BIG-IQ plugin v 3.0.0 enables autoconfiguration of the license manager associated with the BIG-IQ Version 6.0.1. This version was updated for adjusting to PEP8 standards. 

This version of the plugin deploys the following blueprint versions:
 
 - F5-VNF-BIG-IQ blueprint version 3.0.0 and later

Changes to this plugin include support for the following fixes: 

- Pipeline-built image improvements
- Centos bug fixes
- Grammatical typo fixes



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
