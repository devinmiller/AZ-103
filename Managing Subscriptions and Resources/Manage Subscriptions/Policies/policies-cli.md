# Create and Assign Policies Using Azure CLI

Commands for managing policies and policy definitions using Azure CLI.

## Policiy Definitions Commands

### [az policy definition show](https://docs.microsoft.com/en-us/cli/azure/policy/definition?view=azure-cli-latest#az-policy-definition-show)

>Show a policy definition.

#### Parameters

##### _--name_

>The policy definition name.

#### Examples

Get a policy definition by name

``` powershell
PS C:\> az policy definition show --name '0015ea4d-51ff-4ce3-8d8c-f3f8f0179a56'
```

### [az policy definition list](https://docs.microsoft.com/en-us/cli/azure/policy/definition?view=azure-cli-latest#az-policy-definition-list)

>List policy definitions.

#### Examples

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

#### Parameters

##### _--name_

>Name of the new policy definition.

##### _--display-name_

>Display name of policy definition.

##### _--rules_

>Policy rules in JSON format, or a path to a file containing JSON rules.

##### _--params_

>JSON formatted string or a path to a file or uri with parameter definitions.

#### Examples

Create a custom policy definition

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

## Policy Assignment Commands

### [az policy assignment show](https://docs.microsoft.com/en-us/cli/azure/policy/assignment?view=azure-cli-latest#az-policy-assignment-show)

>Show a resource policy assignment.

#### Parameters

##### _--name_

>Name of the policy assignment.

##### _--resource-group_

>The resource group where the policy will be applied.

#### Examples

View a resource policy assignment

``` powershell
PS C:\> az policy assignment show --name AppendDevEnvTag --resource-group az-dev-web-rg
```

### [az policy assignment list](https://docs.microsoft.com/en-us/cli/azure/policy/assignment?view=azure-cli-latest#az-policy-assignment-list)

>List resource policy assignments.

#### Parameters

##### _--resource-group_

>The resource group where the policy will be applied.

#### Examples

Get a policy assignment by name on resource group _az-prod-web-rg_

``` powershell
PS C:\> az policy assignment list --resource-group az-prod-web-rg
```

### [az policy assignment create](https://docs.microsoft.com/en-us/cli/azure/policy/assignment?view=azure-cli-latest)

>Create a resource policy assignment.

#### Parameters

##### _--name_

>Name of the new policy assignment.

##### _--display-name_

>Display name of the policy assignment.

##### _--scope_

>Scope to which this policy assignment applies.

##### _--policy_

>Name or id of the policy definition.

##### _--params_

>JSON formatted string or a path to a file or uri with parameter values of the policy rule.

#### Examples

Create a new policy assignment scoped to resource group _az-prod-web-rg_

``` powershell
PS C:\> $ResourceGroup = az group show --name az-prod-web-rg --query id
PS C:\> $Subscription = az account show --query id --output tsv
PS C:\> $PolicyDefintion = az policy definition list --query "[?displayName=='Append tag and its default value'].id | [0]" --output tsv
# Prepend subscription id to policy - https://github.com/Azure/azure-cli/issues/6343
PS C:\> $FullPolicyDefinition = "/subscriptions/$($Subscription)$($PolicyDefintion)"
PS C:\> $TagValue = '{\"tagName\": { \"value\": \"Environment\" }, \"tagValue\": { \"value\": \"Production\" } }'
PS C:\> az policy assignment create --name "AppendProdEnvTag" --display-name "Append production environment tag" --scope $ResourceGroup --policy $FullPolicyDefinition --params $TagValue  
```
