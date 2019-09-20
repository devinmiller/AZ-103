# Commands for Managing Storage Account Keys with PowerShell

Commands for listing and renewing storage account keys using Powershell

## Commands

### [Get-AzStorageAccountKey](https://docs.microsoft.com/en-us/powershell/module/az.storage/get-azstorageaccountkey?view=azps-2.6.0)

>Gets the access keys for an Azure Storage account.

#### Parameters

##### _-ResourceGroupName_

>Specifies the name of the resource group that contains the Storage account.

##### _-Name_

>Specifies the name of the Storage account for which this cmdlet gets keys.

#### Examples

Get the access keys for a storage account

``` powershell
PS C:\> Get-AzStorageAccountKeys -ResourceGroupName "az-web-prod-rg" -Name "imagedata01"
```

### [New-AzStorageAccountKey](https://docs.microsoft.com/en-us/powershell/module/az.storage/new-azstorageaccountkey?view=azps-2.6.0)

>Regenerates a storage key for an Azure Storage account.

#### Parameters

##### _-ResourceGroupName_

>Specifies the name of the resource group that contains the Storage account.

##### _-Name_

>Specifies the name of the Storage account for which this cmdlet gets keys.

##### _-KeyName_

>Specifies which key to regenerate. The acceptable values for this parameter are:
>
>- key1
>- key2

#### Examples

Regenerate the primary key

``` powershell
PS C:\> New-AzStorageAccountKey -ResourceGroupName "az-web-prod-rg" -Name "imagedata001" -KeyName key1
```
