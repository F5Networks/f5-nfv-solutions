## About supported plugins
F5 Networks created plugins that communicate with external services, such as: cloud services like OpenStack, container-management systems like Kubernetes, configuration management tools like Ansible, and other communication protocols like HTTP and SSH.

Use these plugins to run in F5 VNF Manager and deploy blueprints that automate the scaling, healing, 
and upgrade workflows for your BIG-IP VEs as needed by your application. When using any offering in the supported folder, 
you can [contact F5 Support](https://www.f5.com/company/contact/regional-offices#product-support) for help at anytime.

You can download and install the following supported plugins:

- **f5-gilan-plugin** - This plugin deploys orchestration blueprints using the F5 VNF Manager. You will find multiple versions of this plugin. Consult the readme files for each version to learn more about the features and changes.
- **f5-ric-plugin** - This plugin runs blueprints and functions that manage the billing report feature. You will find multiple versions of this plugin. Consult the readme files for each version to learn more about the features and changes.
- **f5-bigiq-plugin** - This plugin runs blueprints and functions that auto-configure the BIG-IQ license manager utility. This plugin is new for 1.2.1 and later.  


**Note**: F5 Gi LAN and F5 RIC plugins are required for the VNFM Gi-LAN, Gi-Firewall, and VNFM Base blueprint solutions.                      

### Download plugins

1. Download the zip file in this repository.
2. Unzip the file, locally. Notice you have one **.wgn** file and one **.yaml** file. You must upload both files to your VNF Manager.

### Manually upload plugins to VNF Manager

1. Open your VNF Manager, and do one of the following:

   - On the **Dashboard** click **Upload Plugin**.
   - In the left menu click **System Resources**, and then in the **Plugins** pane, click **Upload**.
   
2. In the **Upload plugin** dialog on the top row click :open_file_folder: browse for the downloaded .wgn file, and then click **Open**.
3. In the bottom row, click :open_file_folder: browse for the downloaded .yaml file, and then click **Open**.
4. Click **Upload**.

<!---### <a name="multiversions">Maintain multiple versions of plugins</a>)
[comment]: <> (Blueprints are programmed to use a specific plugin version, or later. Do the following to program the) [comment]: <> (blueprint to use a specific plugin:)
[comment]: <> (1. Step one.)
[comment]: <> (2. Step two.)
[comment]: <> (3. Step three.) --->



#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.

