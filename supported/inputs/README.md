## About inputs files

Inputs files are YAML or JSON files that contain a set of parameters that you must customize according to your system requirements. During the blueprint deployment process, you can upload these inputs files to auto-complete the solution blueprint form in VNF Manager. Each solution blueprint has its own inputs file. 

Appended to the end of each inputs file is an [AS3 Declaration](https://clouddocs.f5.com/products/extensions/f5-appsvcs-extension/3/userguide/components.html#as3-declaration) that you can use to define your application delivery controller for BIG-IP in tenant- and application-oriented terms. 

The inputs directory is organized by VNFM version. The sets of inputs can change from version to version of VNF Manager, and you must download and complete the inputs file specific for the version of F5 VNF Manager you are using.

### Prerequisites and system requirements
Visit the F5 VNFM product documentation for more details about:

- Required <a href="https://clouddocs.f5.com/cloud/nfv/latest/setup.html#prerequisites" target="_blank">prerequisites</a>  
- OpenStack [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#private-cloud-environment-setup)

### To use inputs files

1. Open the inputs file for the solution (Gi Lan, Gi Firewall, or Base) you purchased specific to the VNFM version you are using.
2. Copy and paste the inputs into a local file and complete the parameters using values specific to your system requirements. For parameter definitions, see the [VNF Manager documentation](https://clouddocs.f5.com/cloud/nfv/latest/deploy.html#yaml).
3. Save the file locally, and then upload this file when [deploying blueprints in VNFM](https://clouddocs.f5.com/cloud/nfv/latest/deploy.html#deployblueprint).

#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.

 
