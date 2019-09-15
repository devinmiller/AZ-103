# Create and Manage Groups Using PowerShell

Commands for creating and managing resource groups using PowerShell

## Resource Group Commands

### [Get-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresourcegroup?view=azps-2.6.0)

>Gets resource groups.

#### Parameters

##### _-Name_

>Specifies the name of the resource group to get. This parameter supports wildcards at the beginning and/or the end of the string.

##### _-Location_

>Specifies the location of the resource group to get.

#### Examples

Get a resource group

``` powershell
PS C:\> Get-AzResourceGroup -Name "az-web-prod-rg"
```

Get a resource group and list the tags

``` powershell
PS C:\> (Get-AzResourceGroup -Name "az-web-prod-rg").Tags
```

### [New-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-2.6.0)

>Creates an Azure resource group.

#### Parameters

##### _-Name_

>Specifies a name for the resource group.

##### _-Location_

>Specifies the location of the resource group.

##### _-Tag_

>Key-value pairs in the form of a hash table.

#### Examples

Create a new resource group

``` powershell
PS C:\> New-AzResourceGroup -Name "az-web-prod-rg" -Location "westus"
```

Create a new resource group with tags

``` powershell
PS C:\> New-AzResourceGroup -Name "az-web-prod-rg" -Location "westus" -Tag @{Envrionment="Development"l Department="IT"}
```

### [Set-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/set-azresourcegroup?view=azps-2.6.0)

>Modifies a resource group.

#### Parameters

##### _-Name_

>Specifies the name of the resource group to modify.

##### _-Tag_

>Key-value pairs in the form of a hash table.

#### Examples

Add tags to an existing resource group

``` powershell
PS C:\> Set-AzResourceGroup -Name "az-web-prod-rg" -Tags @{Dept=IT; Owner="SusanBerlin"}
```

## Resource Lock Commands

### [Get-AzResourceLock](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresourcelock?view=azps-2.6.0)

>Gets a resource lock.

**Example 1:** Get resource locks for a resource

``` powershell
PS C:\> Get-AzResourceLock -ResourceGroupName "az-web-prod-rg"
```

### [New-AzResourceLock](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcelock?view=azps-2.6.0)

>Creates a resource lock.

**Example 1:** Create a resource lock

``` powershell
PS C:\> New-AzResourceLock -LockName "WebNoDelete" -LockLevel CanNotDelete -ResourceGroupName "az-web-prod-rg"
```

### [Move-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/move-azresource?view=azps-2.6.0)

>Moves a resource to a different resource group or subscription.

**Example 1:** Move a resource to another resource group

``` powershell
PS C:\> $Resource = Get-AzResource -ResourceGroupName plaz-net2-rg -ResourceName vnet1
PS C:\> Move-AzResource -DestinationResourceGroupName plaz-net-rg -ResourceId $Resource.Id
```
