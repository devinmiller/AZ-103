# Create and Manage Groups Using Azure CLI

Commands for creating and managing resource groups using Azure CLI

## Resource Group Commands

### [az group show](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-show)

>Gets a resource group.

**Example 1:** View the tags for a resource group

``` powershell
PS C:\> az group show --name "az-web-prod-rg" --query tags
```

### [az group create](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-create)

>Create a new resource group.

**Example 1**: Create a new resource group named _az-web-prod-rg_

``` powershell
PS C:\> az group create --name "az-web-prod-rg" --location "westus"
```

### [az group update](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-update)

>Update a resource group.

**Example 1**: Add tags to an existing resource group

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
