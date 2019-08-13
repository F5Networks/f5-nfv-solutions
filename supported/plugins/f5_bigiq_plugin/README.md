## Use the f5_bigiq_plugin
This plugin runs blueprints and functions that auto-configure the BIG-IQ license manager utility. This plugin is new for VNFM version 1.2.1.

### Install f5_bigiq_pluginc

1. [Upload new plugin version to your VNF Manager](https://github.com/F5Networks/f5-nfv-solutions/tree/master/supported/plugins#manually-upload-plugins-to-vnf-manager). 
2. Verify you do not have any deployments associated with the previous plugin version. If you do have existing deployments, 
then redeploy associated blueprints with the new plugin version.
3. Delete the old version of the plugin.
4. Before running any deployment, you must run the required ``./configure.sh`` file.

Consult the individual version readme files to learn more about version-specific features and changes.

