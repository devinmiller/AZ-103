# Create and Manage Groups Using Azure CLI

Commands for creating and managing resource groups using Azure CLI

## Resource Group Commands

### [az group show](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-show)

>Gets a resource group.

#### Parameters

##### _--name_, _--resource-group_, _-g_, _-n_

>Name of resource group.

#### Examples

Get a resource group

``` powershell
PS C:\> az group show -n "az-web-prod-rg"
```

Get a resource group and list tags

``` powershell
PS C:\> az group show -n "az-web-prod-rg" --query tags
```

### [az group create](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-create)

>Create a new resource group.

#### Parameters

##### _--location_, _-l_

>Location.

##### _--name_, _--resource-group_, _-g_, _-n_

>Name of resource group.

##### _--tags_

>Space-separated tags in 'key[=value]' format.

#### Examples

Create a new resource group

``` powershell
PS C:\> az group create -n "az-web-prod-rg" -l "westus"
```

Create a new resource group with tags

``` powershell
PS C:\> az group create -n "az-web-prod-rg" -l "westus" --tags "Environment=Development" "Department=IT"
```

### [az group update](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-update)

>Update a resource group.

#### Parameters

##### _--name_, _--resource-group_, _-g_, _-n_

>Name of resource group.

##### _--set_

>Update an object by specifying a property path and value to set.

#### Examples

Add tags to an existing resource group

``` powershell
PS C:\> az group update --name "az-web-prod-rg" --set tags.Dept="IT" tags.Owner="SusanBerlin"
```

### Resource Lock Commands

### [az group lock list](https://docs.microsoft.com/en-us/cli/azure/group/lock?view=azure-cli-latest#az-group-lock-list)

>List lock information in the resource-group.

**Example 1:** Get resource locks for a resource

``` powershell
PS C:\> az group lock list --resource-group "az-web-prod-rg"
```

### [az lock create](https://docs.microsoft.com/en-us/cli/azure/group/lock?view=azure-cli-latest#az-group-lock-create)

>Creates a resource lock.

**Example 1:** Create a resource lock

``` powershell
PS C:\> az group lock create --name "WebNoDelete" --lock-type CanNotDelete --resource-group "az-web-prod-rg"
```

### [az resource move](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-move)

>Moves resources from one resource group to another(can be under different subscription).

**Example 1:** Move a resource to another resource group

```` powershell
PS C:\> $ResourceId = az resource show --resource-group plaz-net2-rg --name vnet1 --resource-type "Microsoft.Network/virtualNetworks" --query id --output tsv
PS C:\> az resource move --destination-group plaz-net-rg --id $ResourceId
```
