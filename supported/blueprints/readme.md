## Use F5 VNFM solution blueprints
In this directory you will find blueprints for each VNFM solution for both OpenStack and vSpere VIMs; Gi LAN, Gi Firewall, DNS, and Base, as well as an F5 VNF BIG-IQ blueprint for automating the license manager configuration. Within each solution directory you will find supported versions of each blueprint released with each version of VNFM, and for all supported VIMs.

The following list provides a brief description of each solution blueprint:

- **F5-VNF-BIG-IQ** - Enables you to auto-configure the BIG-IQ license manager utility. You can deploy this solution when launching an F5 VNF Manager version 1.2.1 and later.
- **F5-VNF-Service-Layer-Base** - Enables you to deploy BIG-IP VEs in an open configuration model. This blueprint enables you to execute workflows manually.
- **F5-VNF-Service-Layer-GiLAN** - Enables you to deploy BIG-IP VEs that utilize automated service layers that auto-scale virtual machines and services to provide a complete and fully configured set of lifecycle management workflows. For setting up an intergrated CGNAT solution in an OpenStack VIM, refer to [CGNAT-specific AS3 declaration][1].
- **F5-VNF-Service-Layer-Firewall** - Enables you to deploy BIG-IP VEs that utilize firewall protection services only like, DDoS mitigation, DNS security, and intrusion protection. For setting up an intergrated CGNAT solution in an OpenStack VIM, refer to [CGNAT-specific AS3 declaration][1].
- **F5-VNF-DNS** - Plugins, inputs, and blueprints enabling you to query and translate names for client requests. Use this preview DNS solution with VNFM v1.3.1 and later to translate top-level Internet domains, such as .com, /net, .gov, .edu, and .org.
- **F5-VNF-Service-Layer-DNS-Security** - Single-purpose solution specifically designed to clean DNS queries, and includes a standalone DNS security service layer.
- **F5-VNF-Service-Layer-CGNAT-Offering** - Plugins, inputs, and blueprints enabling you to implement CGNAT VNFs on environments with VNFs homed on different networks, not connected to DAG layers, but instead connected to the packet gateway and the provider network.


### Prerequisites and system requirements
Visit the F5 VNFM product documentation for more details about:

- Required [prerequisites](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#prerequisites)  
- OpenStack system requirements for [Queens v13](https://docs.openstack.org/releasenotes/openstack-manuals/queens.html) and [Red Hat OpenStack 16.2](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.2/html/release_notes/index)
- VMware vSphere ESXi 6.5-7.0.3 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/vmware-setup.html)
- VMware Cloud Director 10.3 [system requirements](https://docs.vmware.com/en/VMware-Cloud-Director/10.3.3.3/rn/vmware-cloud-director-10333-release-notes/index.html)

### Download blueprints

1. Download the zip file in this repository.
2. Unzip the file, locally. 

### Manually upload blueprints to VNF Manager

1. On the **VNFM Dashboard** in the left menu, click **Blueprints**.
2. In the **Blueprints** pane, click **Upload**, and then select **Upload blueprint package**.      
3. In the **Upload blueprint** dialog on the top row click :open_file_folder: browse for the downloaded .zip file, and then click **Open**.
4. In the **Blueprint name** text box, enter a descriptive name identifying the EHF.
5. In the **Blueprint YAML file** text box, click :open_file_folder: browse for the downloaded .yaml file, and then click **Open**. 
6. Click **Upload**.

For complete blueprint descriptions, consult the [F5 VNF Manager documentation](https://clouddocs.f5.com/cloud/nfv/latest/vnfm_index.html).

#### Copyright
Copyright 2014-2023 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.


[1]: https://clouddocs.f5.com/cloud/nfv/latest/inputs-def.html#CGNATAS3