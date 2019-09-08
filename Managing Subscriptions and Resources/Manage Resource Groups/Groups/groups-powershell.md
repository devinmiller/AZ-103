# Create and Manage Groups Using PowerShell

Commands for creating and managing resource groups using PowerShell

## Resource Group Commands

### [Get-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresourcegroup?view=azps-2.6.0)

>Gets resource groups.

**Example 1:** View the tags for a resource group

``` powershell
PS C:\> (Get-AzResourceGroup -Name "az-web-prod-rg").Tags
```

### [New-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-2.6.0)

>Creates an Azure resource group.

**Example 1**: Create a new resource group

``` powershell
PS C:\> New-AzResourceGroup -Name "az-web-prod-rg" -Location "westus"
```

### [Set-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/set-azresourcegroup?view=azps-2.6.0)

>Modifies a resource group.

**Example 1**: Add tags to an existing resource group

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
