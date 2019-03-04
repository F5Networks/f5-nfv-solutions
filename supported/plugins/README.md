## About supported plugins
F5 Networks created plugins that communicate with external services, such as: cloud services like OpenStack, container-management systems like Kubernetes, configuration management tools like Ansible, and other communication protocols like HTTP and SSH.

Use these plugins to run in F5 VNF Manager and deploy blueprints that automate the scaling, healing, 
and upgrade workflows for your BIG-IP VEs as needed by your application. When using any offering in the supported folder, 
you can [contact F5 Support](https://www.f5.com/company/contact/regional-offices#product-support) for help at anytime.

You can download and install the following supported plugins:
- **f5-gilan-plugin** - This plugin deploys orchestration blueprints using the F5 VNF Manager. You will find multiple versions of this plugin. Consult the readme files for each version to learn more about the features and changes.
- **f5-ric-plugin** - This plugin runs blueprints and funactions that manage the billing report feature. You will find multiple versions of this plugin. Consult the readme files for each version to learn more about the features and changes.
  
**Note**: Both plugins are required for ALL VNFM solutions (Gi-LAN, Gi-Firewall, and VNFM Base).

| Plugin Name                   | Deploys Blueprint                                                 |                   
| ------------------------------| :-----------------------------------------------------------------|
| f5-gilan-plugin               | F5-VNF-Service-Layer-Base_master-2019-01-08-15-39-21-114497cb     |                         
|                               | F5-VNF-Service-Layer-GiLAN_master-2019-01-08-15-39-21-114497cb    | 
|                               | F5-VNF-Service-Layer-Firewall_master-2019-01-08-15-39-21-114497cb |
| f5-ric-plugin                 | F5-VNF-Service-Layer-Base_master-2019-01-08-15-39-21-114497cb     |
|                               | F5-VNF-Service-Layer-GiLAN_master-2019-01-08-15-39-21-114497cb    |
|                               | F5-VNF-Service-Layer-Firewall_master-2019-01-08-15-39-21-114497cb |
                          


### Prerequisites and system requirements
Visit the F5 VNFM product documentation for more details about:
- Required <a href="https://clouddocs.f5.com/cloud/nfv/latest/setup.html#prerequisites" target="_blank">prerequesites</a>  
- OpenStack [system requirements](https://clouddocs.f5.com/cloud/nfv/latest/setup.html#private-cloud-environment-setup)



