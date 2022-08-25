# Azure VNet-to-VNet sample

Cross-tenant deployment flow:

1. **[Tenant 1]** Fill in the parameters in modules\vnet_gateway.params.json and shared.params.json:

- *region* - target region
- *tags* - collection of tags
- *solutionName* - common name to easily identify all of the solution infrastructure components
- *gatewaySku* - SKU of the Virtual Network Gateway to be created in **[Tenant 1]**
- *gatewaySubnetId* - Id of the existing subnet (GatewaySubnet) in **[Tenant 1]** for the Virtual Network Gateway

2. **[Tenant 1]** Deploy virtual network gateway to an existing resource group and virtual network:

    > deploy_vnet_gateway.ps1 
    Enter deployment resource group name: rg-**tenant1**-vnet2vnet-vpn

3. **[Tenant 2]** Fill in the parameters in modules\vnet_gateway.params.json and shared.params.json:

- *region* - target region
- *tags* - collection of tags
- *solutionName* - common name to easily identify all of the solution infrastructure components
- *gatewaySku* - SKU of the Virtual Network Gateway to be created in **[Tenant 2]**
- *gatewaySubnetId* - Id of the existing subnet (GatewaySubnet) in **[Tenant 2]** for the Virtual Network Gateway

4. **[Tenant 2]** Deploy virtual network gateway to an existing resource group and virtual network:

    > deploy_vnet_gateway.ps1 
    Enter deployment resource group name: rg-**tenant2**-vnet2vnet-vpn

5. Between **[Tenant 1]** and **[Tenant 2]** exchange the respective Virtual Network Gateways Azure resource Ids and agree on a shared key to be used for establishing a connection

6. **[Tenant 1]** Fill in the parameters in modules\connection.params.json:

- *remoteVnetGatewayId* - resource Id of the Virtual Network Gateway created by **[Tenant 2]**

7. **[Tenant 1]** Create a VPN connection:

    > deploy_connection.ps1
    Enter deployment resource group name: rg-**tenant1**-vnet2vnet-vpn
    Please provide string value for 'sharedKey' (? for help): **********

8. **[Tenant 2]** Fill in the parameters in modules\connection.params.json:

- *remoteVnetGatewayId* - resource Id of the Virtual Network Gateway created by **[Tenant 1]**

9. **[Tenant 2]** Create a VPN connection:

    > deploy_connection.ps1
    Enter deployment resource group name: rg-**tenant2**-vnet2vnet-vpn
    Please provide string value for 'sharedKey' (? for help): **********

Most of the steps can be performed in parallel between **[Tenant 1]** and **[Tenant 2]**:

![Cross-tenant deployment flow](docs\vnet-to-vnet-vpn-cross-tenant.png "Title")