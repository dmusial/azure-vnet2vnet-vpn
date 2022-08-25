
param region string
param tags object = {}
param solutionName string
param gatewaySku string
param gatewaySubnetId string

var vnetPublicIpName = 'pip-${solutionName}'
var vnetGatewayName = 'vgw-${solutionName}'

resource vnetGatewayPip 'Microsoft.Network/publicIPAddresses@2022-01-01' = {
  name: vnetPublicIpName
  location: region
  tags: tags
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource vnetGateway 'Microsoft.Network/virtualNetworkGateways@2022-01-01' = {
  name: vnetGatewayName
  location: region
  tags: tags
  properties: {
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    sku: {
      name: gatewaySku
    }
    ipConfigurations: [
      {
          name: 'default'
          properties: {
            subnet: {
                id: gatewaySubnetId
            }
            publicIPAddress: {
               id: vnetGatewayPip.id
            }
          }
      }
    ]
  }
}
