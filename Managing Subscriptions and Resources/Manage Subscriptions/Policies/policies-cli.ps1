#Login-AzAccount

# Get a policy defination by display name
# Example: Get-PolicyDefinition "Require specified tag"
function Get-PolicyDefinition {
    param(
        [string] $displayName
    )

    az policy definition list --query "[?displayName != null && contains(displayName, '$($displayName)')]"
}

# Add policy definition
# Example: Add-PolicyDefinition policy-rule.json 'Required tag and value' -category 'Cost Management'
# PowerShell stripping double quotes from command line arguments
# https://stackoverflow.com/questions/6714165/powershell-stripping-double-quotes-from-command-line-arguments
# Example: Add-PolicyDefinition policy-rule-params.json 'Required tag and value' -parameters '{\"tag\": { \"type\":\"string\" }, \"value\": { \"type\":\"string\" } }'
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
    $optionalArguments = @()
    

    if($PSBoundParameters.ContainsKey('category')) { 
        $optionalArguments += ,'--metadata',"category=$($category)"
    }

    if($PSBoundParameters.ContainsKey('parameters')) {
        $optionalArguments += ,'--params',$parameters
    }
    
    # About splatting - 
    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-6
    az policy definition create --name $policyName --rules $filePath @optionalArguments
}