## About supported plugins, inputs, and blueprints
This directory provides supported F5 VNF Manager plugins, inputs files, and blueprints developed by F5 Networks engineers. You can use these supported plugins and inputs to deploy supported blueprints that automate the use of cloud resources used by your application network. 

### Plugin-blueprint-inputs matrix
The following table describes the supported plugin versions available in this repository, the corresponding blueprints you can deploy using that plugin, and the corresponding inputs file for customizing the blueprint.

| Plugin Name & Version     | Blueprint                                    | Inputs file               |
| --------------------------| :--------------------------------------------| :-------------------------|
| f5-gilan-plugin 0.2.41    | F5-VNF-Service-Layer-GiLAN_v1.1.0.0          | inputs_gilan_v1.1.0.0     |
|                           | F5-VNF-Service-Layer-Firewall_v1.1.0.0       | inputs_firewall_v1.1.0.0  |
|                           | F5-VNF-Service-Layer-Base_v1.1.0.0           | inputs_base_v1.1.0.0      |
|                           |                                              |                           |
| f5-gilan-plugin 0.2.42    | F5-VNF-Service-Layer-GiLAN_v1.1.1.0          | inputs_gilan_v1.1.1       |
|                           | F5-VNF-Service-Layer-Firewall_v1.1.1.0       | inputs_firewall_v1.1.1    |
|                           | F5-VNF-Service-Layer-Base_v1.1.1.0           | inputs_base_v1.1.1        |
|                           |                                              |                           | 
| f5-gilan-plugin 0.2.50    | F5-VNF-Service-Layer-GiLAN_v1.2.0.0          | inputs_gilan_v1.2.0.0     |
|                           | F5-VNF-Service-Layer-Firewall_v1.2.0.0       | inputs_firewall_v1.2.0.0  |
|                           | F5-VNF-Service-Layer-Base_v1.2.0.0           | inputs_base_v1.2.0.0      |
|                           |                                              |                           | 
| f5-gilan-plugin 0.2.51    | F5-VNF-Service-Layer-GiLAN_v1.2.1.0          | inputs_gilan_v1.2.1.0     |
|                           | F5-VNF-Service-Layer-Firewall_v1.2.1.0       | inputs_firewall_v1.2.1    |
|                           | F5-VNF-Service-Layer-Base_v1.2.1.0           | inputs_base_v1.2.1.0      |
|                           |                                              |                           |
| f5-gilan-plugin 0.2.52    | F5-VNF-Service-Layer-GiLAN_v1.3              | inputs_gilan_v1.3         |
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v1.3      | inputs_firewall_v1.3      |
|                           | F5-VNF-Service-Layer-Firewall_v1.3           | inputs_base_v1.3          |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v1.3   | inputs_dns_v1.3.1         | 
|                           | F5-VNF-Service-Layer-Base_v1.3               |                           |
|                           | F5-VNF-Service-Layer-DNS_v1.3.1              |                           |
|                           |                                              |                           |                                               
| f5-gilan-plugin 0.2.53    | F5-VNF-Service-Layer-GiLAN_v1.4.X and later            | inputs_gilan_v1.4.X and later     |
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v1.4.X and later    | inputs_firewall_v1.4.X and later  |
|                           | F5-VNF-Service-Layer-Firewall_v1.4.0 and later         | inputs_base_v1.4.X and later      |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v1.4.X and later | inputs_dns_v1.4.X and later       | 
|                           | F5-VNF-Service-Layer-Base_v1.4.X and later             | inputs_cgnat_offering_v2.0.0 and later       |
|                           | vSphere-F5-VNF-Service-Layer-Base_v1.4.X and later     | inputs_firewall_cgnat_v2.0.0 and later     |
|                           | F5-VNF-Service-Layer-DNS_v1.4.X and later              | inputs_dns_security_v2.0.0 and later  |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v1.4.X and later      |                                   |
|                           | F5-VNF-Service-Layer-DNS-Security and later            |                                   |
|                           | F5-VNF-Service-Layer-CGNAT-Offering_v2.0.0 and later   |                                   |
|                           |                                                        |                               |
|f5-gilan-plugin 2.0.1      | F5-VNF-Service-Layer-GiLAN_v2.0.1                   | inputs_gilan_v2.0.1              |
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v2.0.1           | inputs_firewall_v2.0.1           |
|                           | F5-VNF-Service-Layer-Firewall_v2.0.1                | inputs_base_v2.0.1               |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v2.0.1        | inputs_dns_v2.0.1                |
|                           | F5-VNF-Service-Layer-Base_v2.0.1                    | inputs_gilan_cgnat_v2.0.1        |
|                           | vSphere-F5-VNF-Service-Layer-Base_v2.0.1            | inputs_firewall_cgnat_v2.0.1     |
|                           | F5-VNF-Service-Layer-DNS_v2.0.1                     |                                    |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v2.0.1             |                                    |
|                           | F5-VNF-Service-Layer-CGNAT_v2.0.1                   |                                    |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v2.0.1  |                                    |    
|                           |                                                        |                               |
|f5-gilan-plugin 2.0.2      | F5-VNF-Service-Layer-GiLAN_v2.0.2                   | inputs_gilan_v2.0.2             |
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v2.0.2           | inputs_firewall_v2.0.2           |
|                           | F5-VNF-Service-Layer-Firewall_v2.0.2                | inputs_base_v2.0.2               |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v2.0.2        | inputs_dns_v2.0.2                |
|                           | F5-VNF-Service-Layer-Base_v2.0.2                    | inputs_gilan_cgnat_v2.0.2        |
|                           | vSphere-F5-VNF-Service-Layer-Base_v2.0.2            | inputs_firewall_cgnat_v2.0.2     |
|                           | F5-VNF-Service-Layer-DNS_v2.0.2                     |                                    |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v2.0.2             |                                    |
|                           | F5-VNF-Service-Layer-CGNAT_v2.0.2                   |                                    |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v2.0.2  |                                    |    
|                           |                                                     |                                    |
|f5-gilan-plugin 3.0.0      | F5-VNF-Service-Layer-GiLAN_v3.0.0                   | inputs_gilan_v3.0.0             |
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v3.0.0           | inputs_firewall_v3.0.0           |
|                           | F5-VNF-Service-Layer-Firewall_v3.0.0                | inputs_base_v3.0.0               |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v3.0.0        | inputs_dns_v3.0.0                |
|                           | F5-VNF-Service-Layer-Base_v3.0.0                    | inputs_gilan_cgnat_v3.0.0        |
|                           | vSphere-F5-VNF-Service-Layer-Base_v3.0.0            | inputs_firewall_cgnat_v3.0.0     |
|                           | F5-VNF-Service-Layer-DNS_v3.0.0                     |                                    |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v3.0.0             |                                    |
|                           | F5-VNF-Service-Layer-CGNAT-Offering_v3.0.0          |                                    |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT_v3.0.0           |                                    |  
|                           |                                                     |                                    |
| f5-ric-plugin 0.4         | F5-VNF-Service-Layer-GiLAN_v1.X and later             | inputs_gilan_v1.X  and later        |
|                           | F5-VNF-Service-Layer-Firewall_v1.X and later          | inputs_firewall_v1.X  and later     |
|                           | F5-VNF-Service-Layer-Base_v1.X and later              | inputs_base_v1.X  and later         |
|                           | F5-VNF-Service-Layer-DNS_v1.3.1 and later             | inputs_dns_v1.3.1 and later         |
|                           | F5-VNF-Service-Layer-CGNAT_v2.0.0 and later           |                                     |
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v1.4.X and later   |                                     |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v1.4.X and later|                                     | 
|                           | vSphere-F5-VNF-Service-Layer-Base_v1.X and later      |                                     |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v1.3.1 and later     |                                     |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT_v2.0.0 and later   |                                     |
|                           |                                                        |                                    | 
| f5-ric-plugin 0.5         | F5-VNF-Service-Layer-GiLAN_v1.4.X and later            | inputs_gilan_v1.4.X and later       |
|                           | F5-VNF-Service-Layer-Firewall_v1.4.X and later         | inputs_firewall_v1.4.X and later    |
|                           | F5-VNF-Service-Layer-Base_v1.4.X and later             | inputs_base_v1.4.X and later        |
|                           | F5-VNF-Service-Layer-DNS_v1.4.X and later              | inputs_dns_v1.4.X and later         |
|                           | F5-VNF-Service-Layer-CGNAT_v2.0.0 and later            | inputs_firewall_cgnat_v2.0.0 and later       |      
|                           | F5-VNF-Service-Layer-DNS_Security_v1.4.X and later    |  inputs_gilan_cgnat_v2.0.0 and later
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v1.4.X and later   |  inputs_dns_security_v1.4.0 and later |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v1.4.X and later|  inputs_cgnat_offering_v2.0 and later    | 
|                           | vSphere-F5-VNF-Service-Layer-Base_v1.X and later      |                                     |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v1.3.1 and later     |                                     |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT_v2.0.0 and later   |                                     | 
|                           | vSphere-F5-VNF-Service-Layer-DNS_Security_v1.4.X and later|                                     |
|                           |                                                       |                                     |
| f5-ric-plugin 2.0.1       | F5-VNF-Service-Layer-GiLAN_v2.0.1 and later            | inputs_gilan_v2.0.1 and later       |
|                           | F5-VNF-Service-Layer-Firewall_v2.0.1 and later         | inputs_firewall_v2.0.1 and later    |
|                           | F5-VNF-Service-Layer-Base_v2.0.1 and later             | inputs_base_v2.0.1 and later        |
|                           | F5-VNF-Service-Layer-DNS_v2.0.1 and later              | inputs_dns_v2.0.1 and later         |
|                           | F5-VNF-Service-Layer-CGNAT_v2.0.1 and later            | inputs_firewall_cgnat_v2.0.1 and later       |      
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v2.0.1 and later   |  inputs_cgnat_v2.0.1 and later          |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v2.0.1 and later|  inputs_dns_security_v2.0.1 and later        | 
|                           | vSphere-F5-VNF-Service-Layer-Base_v2.0.1 and later    |                                     |
|                           | vSphere-F5-VNF-Service-Layer-DNS_v2.0.1 and later     |                                     |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT_v2.0.1 and later   |                                     | 
|                           |                                                       |                                     |
| f5-ric-plugin 2.0.2       | F5-VNF-Service-Layer-GiLAN_v2.0.2 and later            | inputs_gilan_v2.0.2 and later       |
|                           | F5-VNF-Service-Layer-Firewall_v2.0.2 and later         | inputs_firewall_v2.0.2 and later    |
|                           | F5-VNF-Service-Layer-Base_v2.0.2 and later             | inputs_base_v2.0.2 and later        |
|                           | F5-VNF-Service-Layer-DNS_v2.0.2 and later              | inputs_dns_v2.0.2 and later         |
|                           | F5-VNF-Service-Layer-CGNAT-Offering_v2.0.2 and later   | inputs_cgnat__Offering_v2.0.2 and later       
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v2.0.2 and later   |  inputs_dns_security_v2.0.2 and later |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v2.0.2 and later|                                       | 
|                           | vSphere-F5-VNF-Service-Layer-Base_v2.0.2 and later    |                                       | 
|                           | vSphere-F5-VNF-Service-Layer-DNS_v2.0.2 and later     |                                       |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v2.0.2 and later|                              | 
|                           |                                                       |                                       |
| f5-ric-plugin 3.0.0       | F5-VNF-Service-Layer-GiLAN_v3.0.0                     | inputs_gilan_v2.0.2 and later       |
|                           | F5-VNF-Service-Layer-Firewall_v3.0.0                  | inputs_firewall_v2.0.2 and later    |
|                           | F5-VNF-Service-Layer-Base_v3.0.0                      | inputs_base_v2.0.2 and later        |
|                           | F5-VNF-Service-Layer-DNS_v3.0.0                       | inputs_dns_v2.0.2 and later         |
|                           | F5-VNF-Service-Layer-CGNAT-Offering_v3.0.0            | inputs_cgnat__Offering_v2.0.2 and later       
|                           | vSphere-F5-VNF-Service-Layer-GiLAN_v3.0.0             | inputs_dns_security_v2.0.2 and later |
|                           | vSphere-F5-VNF-Service-Layer-Firewall_v3.0.0          |                                       | 
|                           | vSphere-F5-VNF-Service-Layer-Base_v3.0.0              |                                       | 
|                           | vSphere-F5-VNF-Service-Layer-DNS_v3.0.0               |                                       |
|                           | vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v3.0.0    |                                       | 
|                           |                                                       |                                       |
| f5-bigiq-plugin 0.1       | F5-VNF-BIG-IQ_v1.2.1.X and later                      | inputs_bigiq.yaml_v1.2.1.X and later |
|                           |                                                       |                                      |
| f5-bigiq-plugin 2.0.2       | F5-VNF-BIG-IQ_v2.0.2                                | inputs_bigiq.yaml_v1.2.0.2 and later |
|                           |                                                       |                                      |
| f5-bigiq-plugin 3.0.0     | F5-VNF-BIG-IQ_v3.0.0.                                 | inputs_bigiq.yaml_v1.3.0.0 and later |
|                           |                                                       |                                      |



**NOTE**: You can ONLY use the F5-bigiq-plugin 0.1 and F5-VNF-BIG-IQ_v1.2.1 and later blueprint when launching the F5 VNF Manager Version 1.2.1 and later.


### Prerequisites and system requirements
Visit the F5 VNFM product documentation for [more prerequisite details](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#pre-existing-networks-and-component) about:

- Required <a href="https://clouddocs.f5.com/cloud/nfv/latest/setup.html#prerequisites" target="_blank">prerequisites</a>  
- Red Hat OpenStack Newton version 10 and Queens version 13 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#private-cloud-environment-setup)
- VMware vSphere ESXi 6.5 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/vmware-setup.html)
- VNFM serial number (ric_vnfm_serial) received in an email upon purchase (required when acquiring support from F5 Networks).
- [CentOS-7-x86_64-GenericCloud-1503](https://wiki.centos.org/Manuals/ReleaseNotes/CentOS7.1810?action=show&redirect=Manuals%2FReleaseNotes%2FCentOS7)

The contents in this directory is fully supported by F5 Networks Support, and for assistance, you can [contact F5 Support](https://www.f5.com/company/contact/regional-offices#product-support) using your preferred methods.

For plugin and blueprint details, consult the individual Readme files for each version. For complete product details, consult the [F5 VNF Manager product document](https://clouddocs.f5.com/cloud/nfv/latest/). 


#### Copyright
Copyright 2014-2022 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.