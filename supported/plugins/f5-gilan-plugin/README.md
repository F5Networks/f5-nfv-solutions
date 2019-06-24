## Use the F5-gilan-plugin
The F5-gilan-plugin deploys orchestration blueprints that create a highly-available set of services, deployed in service layers. It is used to deploy F5 Service Layer infrastructure of BIG-IPs, and depends on the ``./dependencies/cloudify_utilities_plugin-1.11.2-py2-none-any.whl`` file. These layers auto-scale virtual machines and services to provide a complete and fully configured lifecycle management workflow; including, installing and licensing VEs, auto-scaling the number of VEs and service layers as needed, auto-healing VEs, updating and upgrading VEs, and then deleting VEs when no longer needed.

You will find multiple versions of this plugin in this repository. Blueprints are programmed to use a specific plugin version, **or later**. 

### To upgrade plugins

1. [Upload new plugin version to your VNF Manager](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/plugins#manually-upload-plugins-to-vnf-manager). 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.

<!--- If you have downloaded multiple versions of this f5-gilan-plugin and you want the associated blueprint to use a specific version of the plugin, then you must [specify which plugin version](https://github.com/gabetellier/nfv-solutions/blob/master/supported/plugins/README.md#maintain-multiple-versions-of-plugins).--->

Consult the individual version readme files to learn more about version-specific features and changes.
