$deploymentResourceGroupName = Read-Host -Prompt "Enter deployment resource group name"
$vnetGatewayDeploymentName = 'vnetgw'

az deployment group create `
    -n $vnetGatewayDeploymentName `
    -g $deploymentResourceGroupName `
    --template-file .\modules\vnet_gateway.bicep `
    --parameters .\modules\vnet_gateway.params.json `
    --parameters .\shared.params.json