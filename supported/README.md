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
| f5-gilan-plugin 0.2.52    | F5-VNF-Service-Layer-GiLAN_v1.2.1.1          | inputs_gilan_v1.2.1.1     |
|                           | F5-VNF-Service-Layer-Firewall_v1.2.1.1       | inputs_firewall_v1.2.1.1  |
|                           | F5-VNF-Service-Layer-Base_v1.2.1.0           | inputs_base_v1.2.1.0      |

| f5-ric-plugin 0.4         | F5-VNF-Service-Layer-GiLAN_v1.X              | inputs_gilan_v1.X         |
|                           | F5-VNF-Service-Layer-Firewall_v1.X           | inputs_firewall_v1.X      |
|                           | F5-VNF-Service-Layer-Base_v1.X               | inputs_base_v1.X          |
|                           |                                              |                           | 
| f5-bigiq-plugin 0.1       | F5-VNF-BIG-IQ_v1.2.1                         | inputs_bigiq.yaml_v1.2.1  |

**NOTE**: You can ONLY use the F5-bigiq-plugin 0.1 and F5-VNF-BIG-IQ_v1.2.1 blueprint when launching the F5 VNF Manager Version 1.2.1 and later.


### Prerequisites and system requirements
Visit the F5 VNFM product documentation for more details about:

- Required <a href="https://clouddocs.f5.com/cloud/nfv/latest/setup.html#prerequisites" target="_blank">prerequisites</a>  
- Red Hat OpenStack Newton Version 10 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#private-cloud-environment-setup)
- VMware vSphere ESXi 6.5 [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/vmware-setup.html)
- VNFM serial number (ric_vnfm_serial) received in an email upon purchase (required when acquiring support from F5 Networks).

The contents in this directory is fully supported by F5 Networks Support, and for assistance, you can [contact F5 Support](https://www.f5.com/company/contact/regional-offices#product-support) using your preferred methods.

For plugin and blueprint details, consult the individual Readme files for each version. For complete product details, consult the [F5 VNF Manager product document](https://clouddocs.f5.com/cloud/nfv/latest/). 

