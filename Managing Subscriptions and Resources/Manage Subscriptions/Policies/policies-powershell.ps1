#Login-AzAccount

function Get-PolicyDefinition {
    param(
        [string] $displayName
    )

    Get-AzPolicyDefinition | Where-Object { $_.Properties.displayName -eq $displayName }
}

# Add policy definition
# Example: Add-PolicyDefinition policy-rule.json 'Required tag and value' -category 'Cost Management'
# Example: Add-PolicyDefinition policy-rule-params.json 'Required tag and value' -category 'Cost Management' -parameters '{"tag": { "type":"string" }, "value": { "type":"string" } }'
function Add-PolicyDefinition {
    param(
        [Parameter(Mandatory=$true)]
        [string] $fileName,
        [Parameter(Mandatory=$true)]
        [string] $policyName,
        [Parameter(Mandatory=$false)]
        [string] $category,
        [Parameter(Mandatory=$false)]
        [string] $parameters
    )

    $filePath = Get-ChildItem -Path $fileName -Recurse -Force | Select-Object -ExpandProperty FullName

    # Required parameters
    $optionalArguments = @{}

    if($PSBoundParameters.ContainsKey('category')) { 
        $metadata = '{"category": "' + $category + '"}'
        $optionalArguments.Add('Metadata',$metadata) 
    }

    if($PSBoundParameters.ContainsKey('parameters')) {
        $optionalArguments.Add('Parameter', $parameters);
    }

    # About splatting - 
    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-6
    New-AzPolicyDefinition -Name $policyName -Policy $filePath @optionalArguments
}
