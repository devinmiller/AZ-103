# Tag Resources Using PowerShell

Commands for managing tags using PowerShell.

## Commands

### **[Get-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresource?view=azps-2.5.0)**

>The Get-AzResource cmdlet gets Azure resources.

**Example 1:** Get all tags for a Virtual Machine resource named _'vmwebprod001'_.

``` powershell
PS C:\> (Get-AzResource -Name vmwebprod001 -ResourceGroupName web-prod-rg).Tags
```

**Example 2:** Get all resources with the tag _'dept'_.

``` powershell
PS C:\> Get-AzResource -TagName dept
```

**Example 3:** Get all resources with the tag _'dept'_ that have the value _'IT'_.

``` powershell
PS C:\> Get-AzResource -Tag @{dept="IT"}
```

### **[Set-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/set-azresource?view=azps-2.5.0)**

>The Set-AzResource cmdlet modifies an existing Azure resource. Specify a resource to modify by name and type or by ID.

**Example 1:** Set '_dept'_ tag to a value of _'IT'_ for a virtual machine resource named _'vmwebprod001'_.

``` powershell
PS C:\> $Resource = Get-AzResource -Name vmwebprod001 -ResourceGroupName web-prod-rg
PS C:\> Set-AzResource -ResourceId $Resource.Id -Tags @{dept="IT"} -Force
```
