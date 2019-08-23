#Login-AzAccount

# Get all resource with a specific tag name
function Get-ResourceByTagName {
    param (
        [string] $name
    )

    Get-AzResource -TagName $name
}

# Get all resource with a specific tag value
function Get-ResourceByTagValue {
    param (
        [hashtable] $tag
    )

    Get-AzResource -Tag $tag
}

# Get tags for selected resource
# Example: Get-Tags azdevwebdata01 az-dev-web-rg
function Get-Tags {
    param(
        [string] $resourceName,
        [string] $resourceGroup
    )

    #Get a reference to an Azure resource
    $resource = Get-AzResource -Name $resourceName -ResourceGroupName $resourceGroup

    $resource.Tags
}

# Add tags to a selected resource
# Example: Add-Tags azdevwebdata01 az-dev-web-rg -tags @{dept="IT";}
function Add-Tags {
    param(
        [string] $resourceName,
        [string] $resourceGroup,
        #Hashtable format @{key1="val1";key2="val2"}
        [hashtable] $tags
    )

    #Get a reference to an Azure resource
    $resource = Get-AzResource -Name $resourceName -ResourceGroupName $resourceGroup

    #Retrieve existing resource tags, if any
    $resourceTags = $resource.Tags

    #Add new tags to existing tags
    $resourceTags += $tags

    #write new tags to an Azure resource
    Set-AzResource -ResourceId $resource.Id -Tag $resourceTags -Force

    $resource.Tags
}
