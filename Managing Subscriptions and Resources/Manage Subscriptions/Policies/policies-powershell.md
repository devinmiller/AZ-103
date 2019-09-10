# Create and Assign Policies Using PowerShell

Commands for managing policies and policy definitions using PowerShell.

## Policy Definition Commands

### [Get-AzPolicyDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azpolicydefinition?view=azps-2.5.0)

>Gets policy definitions.

#### Parameters

##### _-Name_

>Specifies the name of the policy definition that this cmdlet gets.

#### Examples

Get policy definition by display name.

``` powershell
PS C:\> Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq "Require specified tag" }
```

Get policy definition by category

``` powershell
PS C:\> Get-AzPolicyDefinition | Where-Object { $_.Properties.metadata.category -eq "General" }
```

Get policy definition by name

``` powershell
PS C:\> Get-AzPolicyDefinition -Name "Default tag and value"
```

### [New-AzPolicyDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azpolicydefinition?view=azps-2.5.0)

>Creates a policy definition.

#### Parameters

##### _-Name_

>Specifies a name for the policy definition.

##### _-DisplayName_

>Specifies a display name for the policy definition.

##### _-Policy_

>Specifies a policy rule for the policy definition. You can specify the path of a .json file or a string that contains the policy in JSON format.

##### _-Metadata_

>The metadata for policy definition. This can either be a path to a file name containing the metadata, or the metadata as string.

#### Examples

Create a custom policy definition

``` powershell
PS C:\> New-AzPolicyDefinition -Name "Default tag and value" -Policy "C:\policy-rule.json"
```

Create a custom policy definition with metadata

``` powershell
PS C:\> New-AzPolicyDefinition -Name "Default tag and value" -Metadata '{"category": "Cost Management"}' -Policy "C:\policy-rule.json"
```

Create a custom policy definition with parameters

``` powershell
PS C:\> New-AzPolicyDefinition -Name "Default tag and value" -Policy "C:\policy-rule.json" -Parameter '{"tag": { "type":"string" }, "value": { "type":"string" } }'
```

## Policy Assignment Commands

### [Get-AzPolicyAssignment](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azpolicyassignment?view=azps-1.8.0)

>Gets policy assignments.

#### Parameters

##### _-Name_

>Specifies the name of the policy assignment that this cmdlet gets.

##### _-Scope_

>Specifies the scope at which the policy is applied for the assignment that this cmdlet gets.

#### Examples

Get a policy assignment by name on resource group _az-dev-web-rg_

``` powershell
PS C:\> $ResourceGroup = Get-AzResourceGroup -Name az-dev-web-rg
PS C:\> Get-AzPolicyAssignment -Name "AppendDevEnvTag" -Scope $ResourceGroup.ResourceId
```

Get all policy assignments on resource group _az-web-dev-rg_

``` powershell
PS C:\> $ResourceGroup = Get-AzResourceGroup -Name az-dev-web-rg
PS C:\> Get-AzPolicyAssignment -Scope $ResourceGroup.ResourceId
```

### [New-AzPolicyAssignment](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azpolicyassignment?view=azps-1.8.0)

>Creates a policy assignment.

#### Parameters

##### _-Name_

>Specifies a name for the policy assignment.

##### _-DisplayName_

>Specifies a display name for the policy assignment.

##### _-Scope_

>Specifies the scope at which to assign the policy.

##### _-PolicyDefinition_

>Specifies a policy, as a PsPolicyDefinition object that contains the policy rule.

##### _-PolicyParameterObject_

>The policy parameter object.

#### Examples

Create a new policy assignment scoped to resource group _az-dev-web-rg_

``` powershell
PS C:\> $ResourceGroup = Get-AzResourceGroup -Name az-dev-web-rg
PS C:\> $PolicyDefinition = Get-AzPolicyDefinition | Where-Object { $_.Properties.displayName -eq "Append tag and its default value" }
PS C:\> $TagValue = @{"tagName"="Environment";"tagValue"="Development"}
PS C:\> New-AzPolicyAssignment -Name "AppendDevEnvTag" -DisplayName "Append development environment tag" -Scope $ResourceGroup.Id -PolicyDefinition $PolicyDefinition -PolicyParameterObject $TagValue
```
