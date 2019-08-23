# Tag Resources Using PowerShell

Commands for managing tags using PowerShell.

## Commands

### **[Get-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresource?view=azps-2.5.0)**
>The Get-AzResource cmdlet gets Azure resources.

**Example 1: Get all tags for a resource.**

```
PS C:\> (Get-AzResource -Name ResourceName -ResourceGroupName GroupName).Tags
```

**Example 2: Get all resources with tag name.**
```
PS C:\> Get-AzResource -TagName TagName
```

***Example 3: Get all resources with tag value.**
```
PS C:\> Get-AzResource -Tag @{TagName="TagValue"}
```

### **[Set-AzResource](https://docs.microsoft.com/en-us/powershell/module/az.resources/set-azresource?view=azps-2.5.0)**
>The Set-AzResource cmdlet modifies an existing Azure resource. Specify a resource to modify by name and type or by ID.

**Example 1: Set tags for a resource.**
```
PS C:\> $Resource = Get-AzResource -Name ResourceName -ResourceGroupName GroupName
PS C:\> Set-AzResource -ResourceId $Resource.Id -Tags @{TagName="TagValue"} -Force
```