# Creating Custom Roles Using Azure CLI

Commands for creating custom roles with Azure CLI.

## Commands

### [az role definition list](https://docs.microsoft.com/en-us/cli/azure/role/definition?view=azure-cli-latest#az-role-definition-list)

>List role definitions.

**Example 1:** Get the definition of the reader role

``` powershell
PS C:\> az role definition list --query "[?roleName=='Reader'] | [0]"
```

### [az role definition create](https://docs.microsoft.com/en-us/cli/azure/role/definition?view=azure-cli-latest)

>Create a custom role definition.

**Example 1:** Create a custom role definition

``` powershell
PS C:\> az role definition create --role-definition @policy-rule.json
```
