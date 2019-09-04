# Creating Custom Roles Using PowerShell

Commands for creating custom roles with PowerShell.

## Commands

### [Get-AzProviderOperation](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azprovideroperation?view=azps-2.6.0)

>Gets the operations for an Azure resource provider that are securable using Azure RBAC.

**Example 1:** Get all actions for the Microsoft.Comsumption resource provider

``` powershell
PS C:\> Get-AzProviderOperation Microsoft.Consumption/*
```

### [Get-AzRoleDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azroledefinition?view=azps-2.6.0)

>Lists all Azure RBAC roles that are available for assignment.

**Example 1:** Get the definition of the reader role

``` powershell
PS C:\> Get-AzRoleDefinition -name Reader
```

**Example 2:** Get the definition of the Cost Management Reader role and output it to JSON file

``` powershell
PS C:\> Get-AzRoleDefinition -name "Cost Management Reader" | ConvertTo-Json | Out-File cost-management-reader.json
```

### [New-AzRoleDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azroledefinition?view=azps-2.6.0)

>Creates a custom role in Azure RBAC. Provide either a JSON role definition file or a PSRoleDefinition object as input. First, use the Get-AzRoleDefinition command to generate a baseline role definition object. Then, modify its properties as required. Finally, use this command to create a custom role using role definition.

**Example 1:** Create a custom role definition.

``` powershell
PS C:\> New-AzRoleDefinition -InputFile "cost-management-tagger.json"
```

### [Get-AzRoleAssignment](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azroleassignment?view=azps-2.6.0)

>Lists Azure RBAC role assignments at the specified scope. By default it lists all role assignments in the selected Azure subscription. Use respective parameters to list assignments to a specific user, or to list assignments on a specific resource group or resource.

**Example 1:** List all role assignments in the subscription

``` powershell
PS C:\> Get-AzRoleAssignment
```

**Example 2:** List all role assignments for user dm@cotb.dev, and the groups of which he is a member, at the az-prod-web-rg scope or above.

``` powershell
PS C:\> Get-AzRoleAssignment -ResourceGroupName az-prod-web-rg -SignInName "dm@cotb.dev" -ExpandPrincipalGroups
```

### [New-AzRoleAssignment](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azroleassignment?view=azps-2.6.0)

>Assigns the specified RBAC role to the specified principal, at the specified scope.

**Example 1:** Assign the Reader role to user dm@cotb.dev at the subscription scope

``` powershell
PS c:\> New-AzRoleAssignment -SignInName "dm@cotb.dev" -RoleDefinitionName Reader
```

**Example 2:** Assign the Contributor role to user jdm@cotb.dev at the az-prod-web-rg scope

``` powershell
PS c:\> New-AzRoleAssignment -SignInName "dm@cotb.dev" -RoleDefinitionName Contributor -ResourceGroupName az-prod-web-rg
```

**Example 3:** Assign the Cost Management Reader role to the Finance security group at the subscription scope

``` powershell
PS C:\> $GroupId = (Get-AzADGroup -DisplayName "Finance").Id
PS c:\> New-AzRoleAssignment -ObjectId $GroupId -RoleDefinitionName "Cost Management Reader" -ResourceGroupName az-prod-web-rg
```
