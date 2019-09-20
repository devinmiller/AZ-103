# Commands for Managing Storage Account Keys with Azure CLI

Commands for listing and renewing storage account keys using the Azure CLI

## Commands

### [az storage account keys list](https://docs.microsoft.com/en-us/cli/azure/storage/account/keys?view=azure-cli-latest#az-storage-account-keys-list)

>List the primary and secondary keys for a storage account.

#### Paramters

##### _--resource-group_, _-g_

>Name of resource group.

##### _--account-name_, _-n_

>The storage account name.

#### Examples

Get the access keys for a storage account

``` powershell
PS C:\> az storage account keys list -g "az-web-prod-rg" -n "imagedata01"
```

### [az storage account keys renew](https://docs.microsoft.com/en-us/cli/azure/storage/account/keys?view=azure-cli-latest#az-storage-account-keys-renew)

>Regenerates one of the access keys for the specified storage account.

#### Parameters

##### _--resource-group_, _-g_

>Name of resource group.

##### _--account-name_, _-n_

>The storage account name.

#### _--key_

>The key to regenerate.
>
>Accepted Values: primary, secondary

#### Examples

Regenerate the primary key

``` powershell
PS C:\> az storage account keys renew -g "az-web-prod-rg" -n "imagedata001" --key primary
```
