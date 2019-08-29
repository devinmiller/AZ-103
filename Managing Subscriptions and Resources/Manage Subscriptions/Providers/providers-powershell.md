# Managing Resource Providers Using PowerShell

Commands for managing resource providers with PowerShell

## Commands

### [Get-AzResourceProvider](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresourceprovider?view=azps-2.6.0)

>Gets a resource provider.

**Example 1:** Get the full list of resource providers

``` powershell
PS C:\>  Get-AzResourceProvider -ListAvailable | Format-Table
```

### [Register-AzResourceProvider](https://docs.microsoft.com/en-us/powershell/module/az.resources/register-azresourceprovider?view=azps-2.6.0)

>Registers a resource provider.

**Example 1:** Register a resource provider

``` powershell
PS C:\> Register-AzResourceProvider -ProviderNamespace Microsoft.Botservice
```
