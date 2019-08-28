# Creating Custom Roles Using PowerShell

Commands for creating custom roles with PowerShell.

## Commands

### [Get-AzRoleDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azroledefinition?view=azps-2.6.0)

>Lists all Azure RBAC roles that are available for assignment.

**Example 1:** Get the definition of the reader role

``` powershell
PS C:\> Get-AzRoleDefinition -name Reader
```
