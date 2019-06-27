## Use F5 VNFM solution blueprints
In this directory you will find blueprints for each VNFM solution; Gi LAN, Gi Firewall, and Base. Within each solution 
directory you will find supported versions of each blueprint released with each version of VNFM.

The following table provides a brief description of each solution blueprint:

- **F5-VNF-Service-Layer-Base_v1.X** - Enables you to deploy BIG-IP VEs in an open configuration model. This blueprint enables you to execute workflows manually.
- **F5-VNF-Service-Layer-GiLAN_v1.X** - Enables you to deploy BIG-IP VEs that utilize automated service layers that auto-scale virtual machines and services to provide a complete and fully configured set of lifecycle management workflows.
- **F5-VNF-Service-Layer-Firewall_v1.X** - Enables you to deploy BIG-IP VEs that utilize firewall protection services only like, DDoS mitigation, DNS security, and intrusion protection.

### Prerequisites and system requirements
Visit the F5 VNFM product documentation for more details about:
- Required <a href="https://clouddocs.f5.com/cloud/nfv/latest/setup.html#prerequisites" target="_blank">prerequisites</a>  
- OpenStack Newton 10 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#private-cloud-environment-setup)
- VMware vSphere ESXi 6.5 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/vmware-setup.html)

### Download blueprints

1. Download the zip file in this repository.
2. Unzip the file, locally. 

### Manually upload plugins to VNF Manager

1. On the **Dashboard** click **Upload Blueprint**.      
2. In the **Upload blueprint** dialog on the top row click :open_file_folder: browse for the downloaded .zip file, and then click **Open**.
3. In the **Blueprint name** text box, enter a descriptive name.  This is typically auto-populated for you.
4. In the **Blueprint YAML file** text box, click :open_file_folder: browse for the downloaded .yaml file, and then click **Open**. This is typically auto-populated for you.
5. Click **Upload**.

For complete blueprint descriptions, consult the [F5 VNF Manager documentation](https://clouddocs.f5.com/cloud/nfv/latest/vnfm_index.html).

#### Copyright
Copyright 2014-2019 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
