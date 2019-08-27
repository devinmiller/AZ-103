# Create and Assign Policies Using PowerShell

Commands for managing policies and policy definitions using PowerShell.

## Commands

### [Get-AzPolicyDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azpolicydefinition?view=azps-2.5.0)

>Gets policy definitions.

**Example 1:** Get policy definition by display name.

``` powershell
PS C:\> Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq "Require specified tag" }
```

**Example 2:** Get policy definition by category

``` powershell
PS C:\> Get-AzPolicyDefinition | Where-Object { $_.Properties.metadata.category -eq "General" }
```

### [New-AzPolicyDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azpolicydefinition?view=azps-2.5.0)

>Creates a policy definition.

**Example 1:** Create a custom policy definition

``` powershell
PS C:\> New-AzPolicyDefinition -Name "Default tag and value" -Policy "C:\policy-rule.json"
```

**Example 2:** Create a custom policy definition with metadata

``` powershell
PS C:\> New-AzPolicyDefinition -Name "Default tag and value" -Metadata '{"category": "Cost Management"}' -Policy "C:\policy-rule.json"
```

**Example 3:** Create a custom policy definition with parameters

``` powershell
PS C:\> New-AzPolicyDefinition -Name "Default tag and value" -Policy "C:\policy-rule.json" -Parameter '{"tag": { "type":"string" }, "value": { "type":"string" } }'
```

### [Get-AzPolicyAssignment](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azpolicyassignment?view=azps-1.8.0)

>Gets policy assignments.

**Example 1:** Get a policy assignment by name on resource group _az-dev-web-rg_

``` powershell
PS C:\> $ResourceGroup = Get-AzResourceGroup -Name az-dev-web-rg
PS C:\> Get-AzPolicyAssignment -Name "AppendDevEnvTag" -Scope $ResourceGroup.ResourceId
```

**Example 2:** Get all policy assignments on resource group _az-web-dev-rg_

``` powershell
PS C:\> $ResourceGroup = Get-AzResourceGroup -Name az-dev-web-rg
PS C:\> Get-AzPolicyAssignment -Scope $ResourceGroup.ResourceId
```

### [New-AzPolicyAssignment](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azpolicyassignment?view=azps-1.8.0)

>Creates a policy assignment.

**Example 1:** Create a new policy assignment scoped to resource group _az-dev-web-rg_

``` powershell
PS C:\> $ResourceGroup = Get-AzResourceGroup -Name az-dev-web-rg
PS C:\> $PolicyDefinition = Get-AzPolicyDefinition | Where-Object { $_.Properties.displayName -eq "Append tag and its default value" }
PS C:\> $TagValue = @{"tagName"="Environment";"tagValue"="Development"}
PS C:\> New-AzPolicyAssignment -Name "AppendDevEnvTag" -DisplayName "Append development environment tag" -Scope $ResourceGroup.Id -PolicyDefinition $PolicyDefinition -PolicyParameterObject $TagValue
```
