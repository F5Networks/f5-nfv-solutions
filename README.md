# Introduction
Welcome to the GitHub repository for F5's Network Functions Virtualization plugins and blueprints that are deployed using the F5 VNF Manager. F5 Networks engineers developed all of the plugins and blueprints in this repository.

Consult the [F5 VNF Manager product document](https://clouddocs.f5.com/cloud/nfv/latest/) for complete user documentation.

Across all branches in this repository, there are two directories: *supported* and *experimental*.

- **Supported** - The *supported* directory contains F5 VNFM plugins and blueprints created and fully tested by F5 Networks. These plugins and blueprints are fully supported by F5, and you can contact F5 Technical Support for assistance using your preferred methods.

-	**Experimental** - The *experimental* directory also contains F5 VNFM blueprints created by F5 Networks. However, these blueprints have not completed full testing and are subject to change. F5 Networks does NOT offer technical support for blueprints in the *experimental* directory, so use these blueprints with caution.

# Plugin and blueprint information
You can find descriptions and deployment instructions for each plugin and blueprint in the README file on the individual plugin and blueprint pages in this repository. Consult the following F5 VNFM plugin-blueprint matrix, describing which plugin version can deploy which blueprint.

## Plugin-blueprint matrix
The following table discribes the plugin versions available in this repository, *supported* Vs. *experimental* status, and the corresponding blueprints you can deploy using that plugin.

| Plugin Name & Version         | Status       | Blueprint                               | Status      |
| ------------------------------|--------------|-----------------------------------------|-------------|
| f5-gilan-plugin 0.2.39        | Supported    | F5-VNF-Service-Layer-GiLAN_master       | Supported   |
|                               |              | F5-VNF-Service-Layer-Firewall_master    | Supported   |
|                               |              | F5-VNF-Service-Layer-Base_master        | Supported   |
| f5-ric-plugin 0.4             | Supported    | <insert corresponding blueprint>        | Supported   |

### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 [insert applicable licensed tools]
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
