# Tag Resources Using PowerShell

Commands for managing tags using PowerShell.

## Commands

### **[Get-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresource?view=azps-2.5.0)**

>The Get-AzResource cmdlet gets Azure resources.

#### Get Examples

Get all tags for a Virtual Machine resource named _'vmwebprod001'_.

``` ps1
PS C:\> (Get-AzResource -Name vmwebprod001 -ResourceGroupName web-prod-rg).Tags
```

Get all resources with the tag _'dept'_.

``` ps1
PS C:\> Get-AzResource -TagName dept
```

Get all resources with the tag _'dept'_ that have the value _'IT'_.

``` ps1
PS C:\> Get-AzResource -Tag @{dept="IT"}
```

### **[Set-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/set-azresource?view=azps-2.5.0)**

>The Set-AzResource cmdlet modifies an existing Azure resource. Specify a resource to modify by name and type or by ID.

#### Set Examples

Set '_dept'_ tag to a value of _'IT'_ for a virtual machine resource named _'vmwebprod001'_.

``` ps1
PS C:\> $Resource = Get-AzResource -Name vmwebprod001 -ResourceGroupName web-prod-rg
PS C:\> Set-AzResource -ResourceId $Resource.Id -Tags @{dept="IT"} -Force
```
