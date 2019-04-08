## Use the F5-ric-plugin
F5 Resource Information Collector (F5-ric) plugin is used to collect GiLAN Service Layer information and generate reports. The F5-ric-plugin deploys all billing report-related workflows and functionality. You require this plugin for deploying all VNFM solution blueprints.

You will find multiple versions of this plugin in this repository. Blueprints are programmed to use a specific plugin version, or newer. If you have downloaded multiple versions of this f5-gilan-plugin and you want the associated blueprint to use a specific version of the plugin, then you must [specify which plugin version](https://github.com/gabetellier/nfv-solutions/blob/master/supported/plugins/README.md#maintain-multiple-versions-of-plugins).

### Install F5-ric-plugin

1. Upload a wagon file (``wagons/centos/f5_ric_plugin-0.4-py27-none-any-none-none.wgn``) and ``./plugin.yaml`` to your VNFM. 
2. Before running any deployment, you must run the required ``./configure.sh`` file.  

Consult the individual version readme files to learn more about version-specific features and changes.

