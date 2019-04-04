## Use F5-ric-plugin-0.4 
F5 Resource Information Collector plugin used to collect GiLAN Service Layer information and generate reports. Installation includes, uploading a wagon file (wagons/centos/f5_ric_plugin-0.4-py27-none-any-none-none.wgn) and ./plugin.yaml to your VNFM. Before running any deployment, you must run the required ./configure.sh file.

This plugin deploys the following blueprint version:
 
 - Gi LAN
 - Gi Firewall

### To upgrade plugins

1. Upload new plugin version to your VNF Manager. 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.

#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
