# LAB 02: Azure Networking

## Authenticate to Azure and select the subscription (if you have more than one)

> [!TIP]
> To retrieve the name of your subscription run the following command:

```powershell
Get-AzSubscription | Out-GridView

$SubscriptionName = "<Subscription Name>"
```

## Set up the variables

- Provide the name of your resource group: `$resourceGroupName`

- Provide the name of your new VNet: `$vnetName`

- Provide a name for a location (e.g. `westeurope`): `$location`

### Create a VNet with the `jumpbox` and `management` subnets

> [!TIP]
> Useful cmdlets: `New-AzVirtualNetwork`, `New-AzVirtualNetworkSubnetConfig`, `Set-AzVirtualNetwork`

### Create the network security groups (NSGs)

- Network security rule `allow-SSH-from-internet` should allow an inbound SSH connection from the internet to the `jumpbox` subnet.
- Network security rule `allow-RDP-from-jumpbox` should allow an inbound RDP connection from the `jumpbox` subnet to the `management` subnet.

> [!TIP]
> Useful cmdlets: `New-AzNetworkSecurityRuleConfig`, `New/Get-AzNetworkSecurityGroup`, `Get/Set-AzVirtualNetworkSubnetConfig`, `Get/Set-AzVirtualNetwork`