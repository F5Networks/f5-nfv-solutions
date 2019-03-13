# F5 VNF Manager Blueprints and Plugins
 
<!-- [![Slack Status](https://f5cloudsolutions.herokuapp.com/badge.svg)](https://f5cloudsolutions.herokuapp.com)
[![Releases](https://img.shields.io/github/release/f5networks/f5-aws-cloudformation.svg)](https://github.com/f5networks/f5-aws-cloudformation/releases)
[![Issues](https://img.shields.io/github/issues/f5networks/f5-aws-cloudformation.svg)](https://github.com/f5networks/f5-aws-cloudformation/issues) -->

## Introduction
Welcome to the GitHub repository for F5's Network Functions Virtualization plugins and blueprints that are deployed using the F5 VNF Manager. 
F5 Networks engineers developed all of the plugins and blueprints in this repository. F5 Networks provides the following solutions, and all plugins and blueprints accessible from this repository will work for all solutions unless otherwise noted:

- **Gi-LAN** - plugins and blueprints enabling you to automatically deploy all the necessary pieces to create a highly-available set of services, deployed in service layers. These layers auto-scale virtual machines and services to provide a complete and fully configured lifecycle management workflow: install, scale, heal, update, upgrade, and delete. 
- **Gi-Firewall** - plugins and blueprints enabling you to utilize firewall protection services only like, DDoS mitigation, DNS security, and intrusion protection.
- **VNFM Base** -  plugins and blueprints enabling you to instantiate a group of standalone BIG-IP VEs, on-boarding and licensing these VEs, and manually configure and run the full lifecycle management workflows.

Consult the [F5 VNF Manager product documents](https://clouddocs.f5.com/cloud/nfv/latest/) for complete user documentation. 
Consult the [product compatibility matrix](https://support.f5.com/csp/article/K29047312), for a complete list of released, NFV-related plugins and blueprints. 

Across all branches in this repository, there are two directories: *supported* and *experimental*.

- **Supported** - The *supported* directory contains F5 VNFM plugins created and fully tested by F5 Networks. These plugins are fully supported by F5, and you can contact F5 Technical Support for assistance using your preferred methods.

- **Experimental** - The *experimental* directory also contains F5 VNFM blueprints created by F5 Networks. However, these blueprints have not completed full testing and are subject to change. F5 Networks does NOT offer technical support for blueprints in the *experimental* directory, so use these blueprints with caution.

## Plugin and blueprint information
You can find descriptions and deployment instructions for each plugin and blueprint in the README file on the individual plugin and blueprint pages in this repository. Consult the following F5 VNFM plugin-blueprint matrix, describing which plugin version can deploy which blueprint.

### Plugin-blueprint matrix
The following table discribes the plugin versions available in this repository, *supported* Vs. *experimental* status, and the corresponding blueprints you can deploy using that plugin.

| Plugin Name & Version         | Status       | Blueprint                               | Status      |
| ------------------------------| :------------| :---------------------------------------| :-----------|
| f5-gilan-plugin 0.2.39        | Supported    | F5-VNF-Service-Layer-GiLAN_v1.1.1.0     | Supported   |
|                               |              | F5-VNF-Service-Layer-Firewall_v1.1.1.0  | Supported   |
|                               |              | F5-VNF-Service-Layer-Base_v1.1.1.0      | Supported   |
| f5-ric-plugin 0.4             | Supported    | F5-VNF-Service-Layer-GiLAN_v1.1.1.0     | Supported   |
|                               |              | F5-VNF-Service-Layer-Firewall_v1.1.1.0  | Supported   |
|                               |              | F5-VNF-Service-Layer-Base_v1.1.1.0      | Supported   |

#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
