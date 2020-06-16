## Inputs for VNFM version 2.0.0

In this folder you have YAML file format for use with the F5 VNFM web console and the JSON files with the REST API.  

| VIM                       | New Inputs File                              | New Blueprint Solution         |
| :-------------------------| :--------------------------------------------| :------------------------------| 
| OpenStack (Newton 10) <br>  OpenStack (Queens 13)   | inputs_openstack_bigiq_v2.0.0.yaml<br>inputs_openstack_bigiq_v2.0.0.json<br>inputs_openstack_base_v2.0.0.yaml<br>inputs_openstack_base_v2.0.0.json <br> inputs_openstack_firewall_v2.0.0.yaml <br>  inputs_openstack_firewall_v2.0.0.json <br> inputs_openstack_gilan_v2.0.0.json <br> inputs_openstack_gilan_v2.0.0.yaml <br> inputs_openstack_dns_v2.0.0.yaml<br> inputs_openstack_dns_security_v2.0.0.yaml<br>inputs_openstack_dns_security_v2.0.0.json<br>inputs_openstack_cgnat_v2.0.0.yaml<br>inputs_openstack_cgnat_v2.0.0.json<br>| F5-VNF-BIG-IQ.yaml <br> F5-VNF-Service-Layer-Base_v2.0.0  <br> F5-VNF-Service-Layer-Firewall_v2.0.0<br> F5-VNF-Service-Layer-GiLAN_v2.0.0<br> F5-VNF-Service-Layer-DNS_v2.0.0<br> F5-VNF-Service-Layer-DNS_Security_v2.0.0<br> F5-VNF-Service-Layer-CGNAT-Offering_v2.0.0|
| VMware vSphere ESXi 6.5   | inputs_vsphere_base_v1.3.yaml<br>inputs_vsphere_base_v1.3.json<br>inputs_vsphere_bigiq_v1.3.yaml<br>inputs_vsphere_bigiq_v2.0.0.json<br>inputs_vsphere_firewall_v2.0.0.yaml<br>inputs_vsphere_firewall_v2.0.0.json<br>inputs_vsphere_gilan_v2.0.0.yaml<br>inputs_vsphere_gilan_v2.0.0.json<br>inputs_vsphere_dns_v2.0.0.json<br>inputs_vsphere_dns_security_v2.0.0.json<br>inputs_vsphere_dns_security_v2.0.0.yaml<br>inputs_vsphere_cgnat_v2.0.0.json<br>inputs_vsphere_cgnat_v2.0.0.yaml  | vSphere-F5-VNF-BIG-IQ.yaml <br> vSphere-F5-VNF-Service-Layer-Base_v2.0.0  <br> vSphere-F5-VNF-Service-Layer-Firewall_v2.0.0<br> vSphere-F5-VNF-Service-Layer-GiLAN_v2.0.0<br> vSphere-F5-VNF-Service-Layer-DNS_v2.0.0<br> vSphere-F5-VNF-Service-Layer-DNS-Security_v2.0.0<br> vSphere-F5-VNF-Service-Layer-CGNAT-Offering_v2.0.0.|
 

### What's new

This version contains support for following new/changed features:

* Support deployment to multiple VIMs (multi-VIM or -hypervisor) - You can use one VNFM manager cluster provisioned in a VMware/OpenStack hypervisor that deploys solutions to other VMware or OpenStack hypervisors. This setup requires a new ``datacenter`` input defined for all blueprint solutions. Regardless of which VIM you use, you will now see blueprints for both OpenStack and VMware on the VNFM dashboard. 
*  VNF-BIG-IQ prepare support for VMware Integrated OpenStack (VIO) - Updated the BIG-IQ blueprint solution in preparation for the support of a |bigiqVIO_releaseNotes| environment. If the OpenStack/VIO API does not set the MTU value for your management network, then VNF Manager will use 1400 as the default value for VNF-BIG-IQ blueprint deployments ONLY.
* F5-VNF-Service-Layer-CGNAT-Offering blueprint solution - New blueprint solution used to implement CGNAT VNFs that are directly connected to the PGW and PDN networks. The CGNAT Offering solutions does not have masters or slaves, but instead deploys just CGNAT VNFs in a single-scale group.
* Updated f5-ric-plugin - Updated the Resource Information Collector plugin to generate usage reporting for the F5-VNF-Service-Layer-CGNAT-Offering blueprint.
* New syslog_config input - Added new syslog_config input that attaches an additional BIG-IP VE syslog configuration file. Define this input when using ANY VNF blueprint solution (EXCEPT the VNF Base solution).
* Logs menu - Logs menu enables you to analyse events/logs produced by your deployments. Provides several event log and resource filtering options.
* CLI documentation - Documentation for using the Server Maintenance and Orchestration commands.
* Update as 3 workflow renamed - The workflow named, Update AS 3, is renamed to Update declaration. Run this workflow after editing and uploading changed Telemetry declaration, the AS 3 declaration, or the syslog configuration in your NSD definition for VNF_NSD, NSD_DNS, and NSD_SEC_DNS deployment types. 
* Telemetry declaration - A telemetry_nsd_payload dictionary used for F5 Telemetry Streaming declaration (JSON format) that defines the service configuration of the VNF instances. This declaration is used with all blueprint solutions except Base.
* Site management widget - New Site Management widget enables grouping of deployments by location, providing visibility into installations in your data centers, branches, or edge sites.
* Input validator - Input validator enables input value restrictions, so when deploying a blueprint, you will receive feedback if an input does NOT meet valid criteria; like, predefined port ranges or formatting patterns.
* Workflow actions - Applicable workflows will now include new actions effecting the execution of that workflow.
* Update deployment - Update/change blueprints, input values, and workflow actions for already deployed nodes.


Consult the [latest release notes](https://clouddocs.f5.com/cloud/nfv/latest/release-notes-1.html) for complete details.



#### Copyright
Copyright 2014-2020 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.



[1]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/inputs/v1.2.1/VMware
[2]: https://github.com/F5Networks/f5-nfv-solutions/blob/master/supported/inputs/v1.2.1/OpenStack/inputs_openstack_base_v1.2.1.yaml
[3]: https://github.com/F5Networks/f5-nfv-solutions/blob/master/supported/inputs/v1.2.1/OpenStack/inputs_openstack_bigiq_v1.2.1.yaml
[4]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/inputs/v1.2.1/OpenStack
[5]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/blueprints/base/v1.2.1
[6]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/blueprints/big-iq/v1.2.1
[7]: https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/inputs/v1.2.1/OpenStack
