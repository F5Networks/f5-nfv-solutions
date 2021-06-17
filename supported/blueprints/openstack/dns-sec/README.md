## About the F5 VNF DNS solution blueprint

A preview of the standalone F5 DNS solution is provided in F5 VNFM version 1.3.1 and later. This solution queries and translates names for client requests. This DNS solution translates top-level Internet domains, such as .com, .net, .gov, .edu, and .org. This solution blueprint will deploy into the same space as the Gi LAN solution; such as, between the packet gateway and the Internet. Scaling and usage-billing is based on queries cleaned/second, so once you reach the internally defined threshold, VNFM will auto-scale an additional layer to meet your system demands.

#### Copyright
Copyright 2014-2021 F5 Networks Inc.

#### License

##### Apache V2.0 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##### Contributor License Agreement
Individuals or business entities who contribute to this project must have completed and submitted the F5 Contributor License Agreement.
