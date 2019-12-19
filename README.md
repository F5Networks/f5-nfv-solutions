# F5 VNF Manager plugins, inputs, and blueprints

## Introduction
Welcome to the GitHub repository for F5's Network Functions Virtualization plugins, inputs, and blueprints that are deployed using the F5 VNF Manager. 
F5 Networks engineers developed all of the plugins, inputs, and blueprints in this repository. F5 Networks provides the following solutions, and all plugins and blueprints accessible from this repository will work for all solutions unless otherwise noted:

- **F5-VNF-BIG-IQ** - plugins, inputs, and blueprints enabling you to auto-configure the BIG-IQ license manager utility. You can deploy this solution when launching an F5 VNF Manager version 1.2.1.
- **F5-Gi-LAN** - plugins, inputs, and blueprints enabling you to automatically deploy all the necessary pieces to create a highly-available set of services, deployed in service layers. These layers auto-scale virtual machines and services to provide a complete and fully configured lifecycle management workflow: install, scale, heal, update, upgrade, and delete. 
- **F5-Gi-Firewall** - plugins, inputs, and blueprints enabling you to utilize firewall protection services only like, DDoS mitigation, DNS security, and intrusion protection.
- **F5-Base** -  plugins, inputs, and blueprints enabling you to instantiate a group of standalone BIG-IP VEs, on-boarding and licensing these VEs, and manually configure and run the full lifecycle management workflows.
- **F5-VNF-DNS** - plugins, inputs, and blueprints enabling you to query and translate names for client requests. This DNS solution translates top-level Internet domains, such as .com, /net, .gov, .edu, and .org.
- **F5-VNF-DNS-Security** - plugins, inputs, and blueprints providing the VNF DNS service layer, as well as enabling you to clean the DNS queries.

Consult the [F5 VNF Manager product documents](https://clouddocs.f5.com/cloud/nfv/latest/) for complete user documentation. 
Consult the [product compatibility matrix](https://support.f5.com/csp/article/K29047312), for a complete list of released, NFV-related plugins and blueprints. 

Across all branches in this repository, there are two directories: *supported* and *experimental*.

- **Supported** - The *supported* directory contains F5 VNFM plugins, inputs, and blueprints created and fully tested by F5 Networks. These components are fully supported by F5, and you can contact F5 Technical Support for assistance using your preferred methods. The F5 VNF Manager serial key is required to receive F5 Support. You will receive a product serial key in email when you purchase F5 VNF Manager.

- **Experimental** - The *experimental* directory also contains F5 VNFM blueprints created by F5 Networks. However, these blueprints have not completed full testing and are subject to change. F5 Networks does NOT offer technical support for blueprints in the *experimental* directory, so use these blueprints with caution.

## Plugin, inputs, and blueprint information
You can find descriptions and deployment instructions for each plugin, inputs file, and blueprint in the README file on the individual plugin, inputs, and blueprint pages in this repository. Consult the [F5 VNFM plugin-blueprint-inputs matrix](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported#plugin-blueprint-inputs-matrix), describing which plugin version can deploy which blueprint, and which inputs file customizes which blueprint.

#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
