$deploymentResourceGroupName = Read-Host -Prompt "Enter deployment resource group name"
$connectionDeploymentName = 'vnetgw-connection'

az deployment group create `
    -n $connectionDeploymentName `
    -g $deploymentResourceGroupName `
    --template-file .\modules\connection.bicep `
    --parameters .\modules\connection.params.json `
    --parameters .\shared.params.json