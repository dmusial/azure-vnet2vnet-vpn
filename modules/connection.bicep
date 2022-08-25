param region string
param tags object = {}
param solutionName string
param localVnetGatewayId string
param remoteVnetGatewayId string

@secure()
param sharedKey string

var connectionName = 'con-${solutionName}'

resource connection 'Microsoft.Network/connections@2022-01-01' = {
  name: connectionName
  location: region
  tags: tags
  properties: {
    connectionType: 'Vnet2Vnet' 
    sharedKey: sharedKey
    virtualNetworkGateway1: {
      id: localVnetGatewayId
      properties: { }
    }
    virtualNetworkGateway2: {
      id: remoteVnetGatewayId
      properties: { }
    }
  }
}
