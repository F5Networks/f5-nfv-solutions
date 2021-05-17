## Use f5_bigiq_plugin-2.0.1 
The F5 BIG-IQ plugin v 2.0.1 enables autoconfiguration of the license manager associated with the BIG-IQ Version 6.0.1. This version was updated for naming purposes only. The 2.0.1 release has no new changes/updates since the inital v0.1. 

This version of the plugin deploys the following blueprint versions:
 
 - F5-VNF-BIG-IQ blueprint version 2.0.1 and later

Changes to this plugin include support for the following fixes: 

* You can now restore a snapshot (with the exception of VNFM 2.0.0), and you will no longer encounter the following error: "Restoring snapshot from version 0.0.0 is not supported." Be aware, you may need to make repeated attempts at a snapshot before success.
* For GiLAN or Gi Firewall + CGNAT deployments, you can now make changes to the CGNAT configuration, post deployment.
* The **Update declaration** workflow now synchronizes across all VEs in the VNF layer; therefore, you no longer need to manually push the changes using a ``curl`` command.
* The **Upgrade** workflow no longer automatically admin-disables the old layer. Perform this step manually, as designed.
* The **Heal** workflow no longer returns an error on the ``vnf_layer`` for Gi LAN blueprint deployments.
* The telemetry AS3 declaration now propagates as expected, after executing ``sync-to-device`` group.
* Zooming the map view in the new **Site Management** widget now works as expected.
* You will no longer receive a ``404`` error message when trying to deploy any blueprint on vSphere VIM with a setting of ``switch_distributed=False``.
* Device configuration groups now sync with the master node after executing a **Scale out** workflow for a ``vnf_layer`` deployment.
* When upgrading your BIG-IP VEs, you no longer encounter an error while executing the **Upgrade Start** workflow for a **`VNF Group**.
* New deployments created during a **Scale out** workflow or a **Heal** workflow are now created with updated inputs.
* When you select one type of declaration (AS3, Telemetry Streaming, or Syslog), VNFM no longer triggers all three declaration types, during an update, and the declaration no longer breaks the configuration services on the VNFs.
* You will no longer receive an error in NSD node-telemetry_declaration, when running a configuration_update workflow.
* The Cloud-libs is no longer stuck on ``/tm/sys/available``, and will no longer cause BIG-IP deployment failures on the node.
* If the ``vlan_ip_map`` key has not been defined, you can now scale out resources without failure.
* Nagios no longer fails during installation.
* In the case of the **Scale out** workflow failing (you receive an error message while creating a VE on OpenStack); the **Scale out** workflow will revert/roll back all modifications made. When scaling out multiple VEs simultaneously, the ``ip_assigner node-instances`` is not initialized at the start of the roll-back; for example, ``ip_assigner`` nodes do not have the ``vlan_ip_map`` runtime property defined yet, causing the roll-back procedure to fail. The fix now detects this situation and enables the roll-back procedure to complete, correctly.
* When launching the **Gi LAN** blueprint solution, the ``increment_ips_proxy`` workflow is now blocked when CGNAT is NOT enabled. This is the intended behavior.


#### Copyright
Copyright 2014-2021 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
