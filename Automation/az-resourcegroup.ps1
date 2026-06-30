# Azure Resource Group Creation

$RG_Name='DevOps-RG1'
$Location_name = 'Canada Central'

New-AzResourceGroup -Name $RG_Name -Location $Location_name

Get-AzResourceGroup |
  Sort-Object Location,ResourceGroupName |
    Format-Table -GroupBy Location ResourceGroupName,ProvisioningState,Tags