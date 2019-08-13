## Use the F5-ric-plugin
F5 Resource Information Collector (F5-ric) plugin is used to collect GiLAN Service Layer information and generate reports. The F5-ric-plugin deploys all billing report-related workflows and functionality. You require this plugin for deploying all VNFM solution blueprints.

You will find multiple versions of this plugin in this repository. Blueprints are programmed to use a specific plugin version, or newer. 

<!---If you have downloaded multiple versions of this f5-gilan-plugin and you want the associated blueprint to use a specific version of the plugin, then you must [specify which plugin version](https://github.com/gabetellier/nfv-solutions/blob/master/supported/plugins/README.md#maintain-multiple-versions-of-plugins). --->

### Install F5-ric-plugin

1. [Upload new plugin version to your VNF Manager](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/plugins#manually-upload-plugins-to-vnf-manager). 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.
4. Before running any deployment, you must run the required ``./configure.sh`` file.

Consult the individual version readme files to learn more about version-specific features and changes.

