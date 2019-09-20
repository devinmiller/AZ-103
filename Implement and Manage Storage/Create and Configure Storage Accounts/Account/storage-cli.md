# Commands for Managing Storage Accounts Using Azure CLI

Commands for creating and configuring storage accounts using Azure CLI

## Commands

### [az storage account show](https://docs.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-show)

>Show storage account properties.

#### Parameters

#### _--name_, _-n_

>The storage account name.

#### _--resource-group_, _-g_

>Name of resource group.

#### Examples

Get a specific storage account

``` powershell
PS C:\> az storage account show -g "az-prod-data-rg" -n "azdiagdata01"
```

### [az storage account list](https://docs.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-list)

>List storage accounts.

#### Parameters

#### _--resource-group_, _-g_

>Name of resource group.

#### Examples

Get all storage accounts in a resource group

``` powershell
PS C:\> az storage account list --g "az-prod-data-rg"
```

### [az storage account create](https://docs.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-create)

>Create a storage account.

#### Parameters

##### _--access-tier_

>The access tier used for billing StandardBlob accounts. Cannot be set for StandardLRS, StandardGRS, StandardRAGRS, or PremiumLRS account types. It is required for StandardBlob accounts during creation.
>
>Accepted Values: Cool, Hot

##### _--kind_

>Indicates the type of storage account.
>
>Accepted Values: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2
>
>Default Value: Storage

##### _--location_, _-l_

>Location.

##### _--name_, _-n_

> Specifies the name of the Storage account to create.

##### _--resource-group, _-g_

>Specifies the name of the resource group in which to add the Storage account.

##### _--sku_

>The storage account SKU.
>
>Accepted Values: Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS
>
>Default Value: Standard_RAGRS

#### Examples

Create a Kind StorageV2 storage account

``` powershell
PS C:\> az storage account create -g "az-prod-data-rg" -n "azdiagdata001" l "westus" --kind StorageV2 --sku Standard_LRS
```

Create a Blog storage account  with BlobStorage Kind and hot AccessTier

``` powershell
PS C:\> az storage account create -g "az-prod-data-rg" -n "azdiagdata001" l "westus" --kind BlobStorage --access-tier Hot --sku Standard_LRS
```

### [az storage account delete](https://docs.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-delete)

>Delete a storage account.

#### Parameters

##### _--name_, _-n_

>The storage account name.

##### _--resource-group, _-g_

>Name of resource group.

#### Examples

Delete a storage account

``` powershell
PS C:\> az storage account delete -g "az-prod-data-rg" -n "azdiagdata01"
```
