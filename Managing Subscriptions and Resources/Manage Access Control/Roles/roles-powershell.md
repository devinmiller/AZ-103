# Creating Custom Roles Using PowerShell

Commands for creating custom roles with PowerShell.

## Commands

### [Get-AzRoleDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azroledefinition?view=azps-2.6.0)

>Lists all Azure RBAC roles that are available for assignment.

**Example 1:** Get the definition of the reader role

``` powershell
PS C:\> Get-AzRoleDefinition -name Reader
```

### [New-AzRoleDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azroledefinition?view=azps-2.6.0)

>Creates a custom role in Azure RBAC. Provide either a JSON role definition file or a PSRoleDefinition object as input. First, use the Get-AzRoleDefinition command to generate a baseline role definition object. Then, modify its properties as required. Finally, use this command to create a custom role using role definition.

**Example 1:** Create a custom role definition.

``` powershell
PS C:\> New-AzRoleDefinition -InputFile "policy-rule.json"
```
