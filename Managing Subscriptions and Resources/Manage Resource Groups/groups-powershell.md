# Create and Manage Groups Using PowerShell

Commands for creating and managing resource groups using PowerShell

## Commands

### [New-AzResourceGroup](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-2.6.0)

>Creates an Azure resource group.

**Example 1**: Create a new resource group named _az-web-prod-rg_

``` powershell
PS C:\> New-AzResourceGroup -name "az-web-prod-rg" -location "westus"
```
