# Create and Assign Policies Using PowerShell

Commands for managing policies and policy definitions using PowerShell.

## Commands

### [Get-AzPolicyDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azpolicydefinition?view=azps-2.5.0)

>Gets policy definitions.

#### Get Examples

Get policy definition by display name.

``` powershell
PS C:\> Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq "Require specified tag" }
```

Get policy definition by category

``` powershell
PS C:\> Get-AzPolicyDefinition | Where-Object { $_.Properties.metadata.category -eq "General" }
```

### [New-AzPolicyDefinition](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azpolicydefinition?view=azps-2.5.0)

>Creates a policy definition.

#### Create Examples

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
