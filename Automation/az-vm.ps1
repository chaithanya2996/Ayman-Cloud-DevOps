$ResourceGroup = "Ayman-RG"
$Location      = "Canada Central"
$VMName        = "mydevopsvm"
$VNetName      = "AymanVNet"
$SubnetName    = "Default"
$PublicIPName  = "AymanPublicIP"
$NICName       = "AymanNIC"
$NSGName       = "AymanNSG"



New-AzResourceGroup `
-Name $ResourceGroup `
-Location $Location

$Subnet = New-AzVirtualNetworkSubnetConfig `
-Name $SubnetName `
-AddressPrefix "10.0.0.0/24"

$VNet = New-AzVirtualNetwork `
-ResourceGroupName $ResourceGroup `
-Location $Location `
-Name $VNetName `
-AddressPrefix "10.0.0.0/16" `
-Subnet $Subnet


$PublicIP = New-AzPublicIpAddress `
-Name $PublicIPName `
-ResourceGroupName $ResourceGroup `
-Location $Location `
-AllocationMethod Static `
-Sku Standard

$RuleSSH = New-AzNetworkSecurityRuleConfig `
-Name "AllowSSH" `
-Protocol Tcp `
-Direction Inbound `
-Priority 1000 `
-SourceAddressPrefix "*" `
-SourcePortRange "*" `
-DestinationAddressPrefix "*" `
-DestinationPortRange 22 `
-Access Allow

$RuleRDP = New-AzNetworkSecurityRuleConfig `
-Name "AllowRDP" `
-Protocol Tcp `
-Direction Inbound `
-Priority 1001 `
-SourceAddressPrefix "*" `
-SourcePortRange "*" `
-DestinationAddressPrefix "*" `
-DestinationPortRange 3389 `
-Access Allow

$RuleAllowAll = New-AzNetworkSecurityRuleConfig `
-Name "Allow-ALL" `
-Protocol Tcp `
-Direction Inbound `
-Priority 1000 `
-SourceAddressPrefix "*" `
-SourcePortRange "*" `
-DestinationAddressPrefix "*" `
-DestinationPortRange * `
-Access Allow


$NSG = New-AzNetworkSecurityGroup `
-ResourceGroupName $ResourceGroup `
-Location $Location `
-Name $NSGName `
-SecurityRules $RuleAllowAll


$NIC = New-AzNetworkInterface `
-Name $NICName `
-ResourceGroupName $ResourceGroup `
-Location $Location `
-SubnetId $VNet.Subnets[0].Id `
-PublicIpAddressId $PublicIP.Id `
-NetworkSecurityGroupId $NSG.Id



$VM = New-AzVMConfig `
-VMName $VMName `
-VMSize "Standard_B1s"

$VM = Set-AzVMOperatingSystem `
-VM $VM `
-Linux `
-ComputerName $VMName `
-Credential $Credential

$VM = Set-AzVMSourceImage `
-VM $VM `
-PublisherName Canonical `
-Offer UbuntuServer `
-Skus 22_04-lts `
-Version latest

$VM = Add-AzVMNetworkInterface `
-VM $VM `
-Id $NIC.Id

New-AzVM `
-ResourceGroupName $ResourceGroup `
-Location $Location `
-VM $VM

New-AzVM `
-ResourceGroupName $ResourceGroup `
-Location $Location `
-VM $VM