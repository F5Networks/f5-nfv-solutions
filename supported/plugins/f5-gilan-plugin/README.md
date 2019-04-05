## Use the F5-gilan-plugin
The F5-gilan-plugin deploys orchestration blueprints that create a highly-available set of services, deployed in service layers. It is used to deploy F5 Service Layer infrastructure of BIG-IPs, and depends on the ``./dependencies/cloudify_utilities_plugin-1.11.2-py2-none-any.whl`` file. These layers auto-scale virtual machines and services to provide a complete and fully configured lifecycle management workflow; including, installing and licensing VEs, auto-scaling the number of VEs and service layers as needed, auto-healing VEs, updating and upgrading VEs, and then deleting VEs when no longer needed.

You will find multiple versions of this plugin in this repository. Blueprints are programmed to use a specific plugin version, **or later**. If you have downloaded multiple versions of this f5-gilan-plugin and you want the associated blueprint to use a specific version of the plugin, then you must [specify which plugin version](#multiversions).

Consult the individual version readme files to learn more about version-specific features and changes.

### Download plugins

1. Download the zip file in this repository.
2. Unzip the file, locally. Notice you have one **.wgn** file and one **.yaml** file. You must upload both files to your VNF Manager.

### Manually upload plugins to VNF Manager

1. Open your VNF Manager, and do one of the following:

   - On the **Dashboard** click **Upload Plugin**.
   - In the left menu click **System Resources**, and then in the **Plugins** pane, click **Upload**.
      
2. In the **Upload plugin** dialog on the top row click :open_file_folder: browse for the downloaded .wgn file, and then click **Open**.
4. In the bottom row, click :open_file_folder: browse for the downloaded .yaml file, and then click **Open**.
5. Click **Upload**.

### <a name="multiversions"></a>Maintain multiple versions of plugins
Blueprints are programmed to use a specific plugin version, or later. Do the following to program the blueprint to use a specific plugin:

1. Step one.
2. Step two.
3. Step three. 
