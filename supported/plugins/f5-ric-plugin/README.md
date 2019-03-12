## Use the F5-ric-plugin
F5 Resource Information Collector (F5-ric) plugin is used to collect GiLAN Service Layer information and generate reports. The F5-ric-plugin deploys all billing report-related workflows and functionality? You require this plugin for deploying all VNFM solution blueprints.

You will find multiple versions of this plugin in this repository. Blueprints are programmed to use a specific plugin version, or newer. If you have downloaded multiple versions of this f5-gilan-plugin and you want the associated blueprint to use a specific version of the plugin, then you must [specify which plugin version](#multiversions).

Consult the individual version readme files to learn more about version-specific features and changes.

### Install F5-ric-plugin

1. Upload a wagon file (``wagons/centos/f5_ric_plugin-0.4-py27-none-any-none-none.wgn``) and ``./plugin.yaml`` to your VNFM. 
2. Before running any deployment, you must run the required ``./configure.sh`` file.  

### Download plugins

1. Download the zip file in this repository.
2. Unzip the file, locally. Notice you have one **.wgn** file and one **.yaml** file. You must upload both files to your VNF Manager.

### Manually upload plugins to VNF Manager

1. Open your VNF Manager, and do one of the following:

   - On the **Dashboard** click **Upload Plugin**.
   - In the left menu click **System Resources**, and then in the **Plugins** pane, click **Upload**.
   
2. In the **Upload plugin** dialog on the top row click :paperclip: browse for the downloaded .wgn file, and then click **Open**.
3. In the bottom row, click :paperclip: browse for the downloaded .yaml file, and then click **Open**.
4. Click **Upload**.

### <a name="multiversions"></a>Maintain multiple versions of plugins
Blueprints are programmed to use a specific plugin version, or later. Do the following to program the blueprint to use a specific plugin:

1. Step one.
2. Step two.
3. Step three. 

