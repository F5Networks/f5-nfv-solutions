## Example blueprints

In this directory you will find the following example blueprints that will help demonstrate how to use F5 solution blueprints, or use your own or other vendor blueprint solutions with F5 VNF Manager.

### Using the F5-bigip-demo-cloud-libs example blueprint

In this example directory you will find a blueprint solution that you can upload to Cloudify 5.05 and use with the F5 Gilan Plugin 2.1.0 file for instantiating a pair of BIG-IP VEs for HA purposes.

This blueprint will onboard BIG-IP VE using F5 Cloud-libs and will configure the VEs using F5 AS3 declaration. 

#### To upload the F5 Gilan Plugin to your Cloudify 5.05 Web app 

Upon purchasing the F5 Gilan Plugin, you will receive an email with a download link and a license key. 

1.	Download the F5 Gilan Plugin .ova/.zip file and extract the file locally. You will have one .wgn file and one .yaml file.
2.	Open your Cloudify 5.05 web application, and in the left menu click the **System Resources** blade.
3.	Do the following to upload the plugin files:

     * Above the **Plugins table** click **Upload**.
     * Either enter the URL of the .wgn file or select the .wgn file from your local file repository.
     * Either enter the URL of the plugin .yaml file or select the plugin .yaml file from your local file repository.
     * Click **Upload**. The F5 Gilan plugin details appear in the **Plugins** table.

**NOTE:** Plugins are tenant-specific, so a blueprint on one tenant cannot use/access a plugin uploaded to a different tenant.


#### To deploy the F5-bigip-demo-cloud-libs example blueprint 

1. Create a local zip file of the **F5-bigip-demo-cloud-libs** directory.
2. Open Cloudify 5.05 Web app, in the left pane click the **Local Blueprints** blade.
3. Click **Upload**, in the **Upload Blueprint** dialog, navigate to the local blueprint zip file you created in step 1.
4. Complete the following, and then click **Upload**:

     * **Blueprint name**: F5-bigip-demo-cloud-libs
     * **Blueprint YAML file**: F5-bigip-demo-cloud-libs.yaml

5. To deploy the demo blueprint, click the **Rocket** icon next to the **5-bigip-demo-cloud-libs** blueprint in the list.
6. In the **Deploy Blueprint** dialog, click **Load Values**, and navigate to the sample **openstack_bigip_demo_inputs_cloud_libs.yaml** inputs file found in the  ``F5-bigip-demo-cloud-libs/inputs`` directory.
7. In the left menu, click the **Deployments** blade, in the list next to the **F5-bigip-demo-cloud-libs** blueprint you uploaded in the previous steps, expand the **more** icon, click **Install**, and then click **Execute**. 
8. Wait for the installation to complete (approx. 15 minutes). A successful deployment installation will turn green.
9. To test the deployment, do the following:

     * Click the **Deployments** blade, click the **F5-bigip-demo-cloud-libs** deployment to open it, and then scroll to the **Deployment Outputs** pane.
     * Click the **http_endpoint**, and if you see something similar to ``Not secure | http://10.190.55.102:8080`` and a directory listing, then the client machine with the ``web_server`` was successfully configured and installed. 

10. To test the entire blueprint (BIG IP and your environment), connect using ``ssh`` to the client/web_server machine, and then run the following from **Deployment Outputs**:

    ```
    
    test_command (curl 10.10.11.100:80 - 10.10.11.100 is the address of the virtual server, 80 is the virtual port of the virtual server) 
    
    ```
    
In this *F5-bigip-demo-cloud-libs* example, the onboarding processes are done by two nodes: 

* ``cloud_config_runcmds`` – license, configuration, and other similar tasks that define the following onboarding variables:

    *  ``custom_ltm_level``
    *  ``custom_afm_level``
    *  ``custom_pem_level``
    *  ``custom_gtm_level``
 
* ``onboard_network_nnic`` – network configuration tasks that define the following variables for onboarding nnic configuration:

    * ``bgp_pgw_peer_ip``
    * ``bgp_pgw_peer_as``
    * ``bgp_egw_peer_ip``
    * ``bgp_egw_peer_as``






[1]: https://clouddocs.f5.com/cloud/nfv/latest/