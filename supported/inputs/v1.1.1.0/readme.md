## Inputs for VNFM version 1.1.1

In this folder you have YAML file format for use with the [F5 VNFM web console](https://clouddocs.f5.com/cloud/nfv/latest/vnfm_index.html) and the .json files with the [REST API](https://clouddocs.f5.com/cloud/nfv/latest/CM-REST-API.html). The inputs for this version of VNFM were changed to accommodate the following:

- Additional input parameters enabling you to define an availability zone in OpenStack VIM.
- Fix for the Scaling workflows executed on a layer, preventing the Heal workflow from executing immediately after the new slave is created.
