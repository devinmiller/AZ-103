# az --version
# az login

# Get all resource with a specific tag name
function Get-ResourceByTagName {
    param (
        [string] $name
    )

    az resource list --tag $name
}

# Get all resource with a specific tag value
function Get-ResourceByTagValue {
    param (
        [string] $tag
    )

    az resource list --tag $tag
}

# Get tags for selected resource
# Example: Get-Tags defaultdata001 default-prod-rg microsoft.storage/storageaccounts
function Get-Tags {
    param(
        [string] $resourceName,
        [string] $resourceGroup,
        [string] $resourceType
    )

    #Get the details of an Azure resource and query for tags
    az resource show -g $resourceGroup -n $resourceName --resource-type $resourceType --query tags
}

# Add tags to a selected resource
# Example: Add-Tags defaultdata001 default-prod-rg "Microsoft.Storage/storageAccounts" @{Role="Backup";Product="Default"}
function Add-Tags {
    param(
        [string] $resourceName,
        [string] $resourceGroup,
        [string] $resourceType,
        [hashtable] $tags
    )

    $resourceTags = ($tags.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" })

    # Write new tags to an Azure resource
    az resource tag --tags $resourceTags -g $resourceGroup -n $resourceName --resource-type $resourceType
}