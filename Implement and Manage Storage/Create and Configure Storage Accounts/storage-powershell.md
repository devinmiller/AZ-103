# Commands for Managing Storage Accounts Using PowerShell

Commands for creating and configuring storage accounts using PowerShell

## Commands

### [Get-AzStorageAccount](https://docs.microsoft.com/en-us/powershell/module/az.storage/get-azstorageaccount?view=azps-2.6.0)

>Gets a Storage account.

#### Parameters

#### _-Name_

>Specifies the name of the Storage account to get.

#### _-ResourceGroupName_

>Specifies the name of the resource group that contains the Storage account to get.

#### Examples

Get a specific storage account

``` powershell
PS C:\> Get-AzStorageAccount -ResourceGroupName "az-prod-data-rg" -Name "azdiagdata01"
```

Get all storage accounts in a resource group

``` powershell
PS C:\> Get-AzStorageAccount -ResourceGroupName "az-prod-data-rg"
```

### [New-AzStorageAccount](https://docs.microsoft.com/en-us/powershell/module/az.storage/new-azstorageaccount?view=azps-2.6.0)

>Creates a Storage account.

#### Parameters

##### _-AccessTier_

>Specifies the access tier of the Storage account that this cmdlet creates. The acceptable values for this parameter are: Hot and Cool. If you specify a value of BlobStorage for the Kind parameter, you must specify a value for the AccessTier parameter. If you specify a value of Storage for this Kind parameter, do not specify the AccessTier parameter.

##### _-Kind_

>Specifies the kind of Storage account that this cmdlet creates.  The acceptable values for this parameter are
>
>- Storage
>- StorageV2
>- BlobStorage
>- BlockBlobStorage
>- FileStorage
>
>The default value is Storage.

##### _-Location_

>Specifies the location of the Storage account to create.

##### _-Name_

> Specifies the name of the Storage account to create.

##### _-ResourceGroupName_

>Specifies the name of the resource group in which to add the Storage account.

##### _-SkuName_

>Specifies the SKU name of the Storage account that this cmdlet creates. The acceptable values for this parameter are:
>
>- Standard_LRS
>- Standard_ZRS
>- Standard_GRS
>- Standard_RAGRS
>- Premium_LRS
>- Premium_ZRS

#### Examples

Create a Kind StorageV2 storage account

``` powershell
PS C:\> New-AzStorageAccount -ResourceGroupName "az-prod-data-rg" -AccountName "azdiagdata001" Location "westus" -Kind StorageV2 -SkuName Standard_LRS
```

Create a Blog storage account  with BlobStorage Kind and hot AccessTier

``` powershell
PS C:\> New-AzStorageAccount -ResourceGroupName "az-prod-data-rg" -AccountName "azdiagdata001" Location "westus" -Kind BlobStorage -AccessTier Hot -SkuName Standard_LRS
```

### [Remove-AzStorageAccount](https://docs.microsoft.com/en-us/powershell/module/az.storage/remove-azstorageaccount?view=azps-2.6.0)

>Removes a Storage account from Azure.

#### Parameters

#### _-Name_

>Specifies the name of the Storage account to remove.

#### _-ResourceGroupName_

>Specifies the name of the resource group that contains the Storage account to remove.

#### Examples

Remove a storage account.

``` powershell
PS C:\> Remove-AzStorageAccount -ResourceGroupName "az-prod-data-rg" -Name "azdiagdata01"
```
