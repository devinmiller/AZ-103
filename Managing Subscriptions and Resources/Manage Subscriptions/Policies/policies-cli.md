# Create and Assign Policies Using Azure CLI

Commands for managing policies and policy definitions using Azure CLI.

## Commands

### [az policy definition show](https://docs.microsoft.com/en-us/cli/azure/policy/definition?view=azure-cli-latest#az-policy-definition-show)

>Show a policy definition.

#### Show Examples

Get a policy definition by name

``` powershell
PS C:\> az policy definition show --name '0015ea4d-51ff-4ce3-8d8c-f3f8f0179a56'
```

### [az policy definition list](https://docs.microsoft.com/en-us/cli/azure/policy/definition?view=azure-cli-latest#az-policy-definition-list)

>List policy definitions.

### List Examples

Get a policy definition by display name

``` powershell
PS C:\> az policy definition list --query "[?displayName=='Require specified tag']"
```

Search a list of policy definition by display name

``` powershell
PS C:\> az policy definition list --query "[?displayName != null && contains(displayName, 'tag')].{Key:name, Name:displayName, PolicyType:policyType}" --output table
```

### [az policy definition create](https://docs.microsoft.com/en-us/cli/azure/policy/definition?view=azure-cli-latest#az-policy-definition-create)

>Create a policy definition.

### Create Examples

``` powershell
PS C:\> az policy definition create --name "-Default tag and value" --rules "C:\policy-rule.json"
```

Create a custom policy definition with metadata

``` powershell
PS C:\> az policy definition create --name "-Default tag and value" --rules "C:\policy-rule.json" --metadata category="Cost Management"
```

Create a custom policy definition with parameters

``` powershell
PS C:\> az policy definition create --name "-Default tag and value" --rules "C:\policy-rule-params.json" --params '{\"tag\": { \"type\":\"string\" }, \"value\": { \"type\":\"string\" } }'
```
