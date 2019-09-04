# Creating Custom Roles Using Azure CLI

Commands for creating custom roles with Azure CLI.

## Commands

### [az provider operation list](https://docs.microsoft.com/en-us/cli/azure/provider/operation?view=azure-cli-latest#az-provider-operation-list)

>Get operations from all providers.

**Example 1:** Get all actions for the Microsoft.Comsumption resource provider

``` powershell
PS C:\> az provider operation list --query "[].resourceTypes[].operations[] | [?contains(name, 'Microsoft.Consumption')]"
```

### [az role definition list](https://docs.microsoft.com/en-us/cli/azure/role/definition?view=azure-cli-latest#az-role-definition-list)

>List role definitions.

**Example 1:** Get the definition of the reader role

``` powershell
PS C:\> az role definition list --query "[?roleName=='Reader'] | [0]"
```

**Example 2:** Get the definition of the Cost Management Reader role and output it to JSON file

``` powershell
PS C:\> az role definition list --query "[?roleName=='Cost Management Reader'"] > cost-management-reader.json
```

### [az role definition create](https://docs.microsoft.com/en-us/cli/azure/role/definition?view=azure-cli-latest)

>Create a custom role definition.

**Example 1:** Create a custom role definition

``` powershell
PS C:\> az role definition create --role-definition @cost-management-tagger.json
```

### [az role assignment list](https://docs.microsoft.com/en-us/cli/azure/role/assignment?view=azure-cli-latest#az-role-assignment-list)

>List role assignments.

**Example 1:** List all role assignments in the subscription

``` powershell
PS C:\> az role assignment list --all
```

**Example 2:** List all role assignments for user dm@cotb.dev, and the groups of which he is a member, at the az-prod-web-rg scope or above.

``` powershell
PS C:\> az role assignment list --resource-group az-prod-web-rg -assignee "dm@cotb.dev"
```

### [az role assignment create](https://docs.microsoft.com/en-us/cli/azure/role/assignment?view=azure-cli-latest#az-role-assignment-create)

>Create a new role assignment for a user, group, or service principal.

**Example 1:** Assign the Reader role to user dm@cotb.dev at the subscription scope

``` powershell
PS c:\> az role assignment create --assignee "dm@cotb.dev" --role Reader
```

**Example 2:** Assign the Contributor role to user jdm@cotb.dev at the az-prod-web-rg scope

``` powershell
PS c:\> az role assignment create --assignee "dm@cotb.dev" --role Contributor --resource-group az-prod-web-rg
```

**Example 3:** Assign the Cost Management Reader role to the Finance security group at the subscription scope

``` powershell
PS C:\> $GroupId = az ad group show --group "Finance" --query objectId --output tsv
PS c:\> az role assignment create --assignee $GroupId --role "Cost Management Reader" --resource-group az-prod-web-rg
```
