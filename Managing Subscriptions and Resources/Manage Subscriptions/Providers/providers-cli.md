# Managing Resource Providers Using Azure CLI

Commands for managing resource providers with Azure CLI

## Commands

### [az provider list](https://docs.microsoft.com/en-us/cli/azure/provider?view=azure-cli-latest#az-provider-list)

>Gets a resource provider.

**Example 1:** Get the full list of resource providers

``` powershell
PS C:\>  az provider list --output table
```

### [az provider register](https://docs.microsoft.com/en-us/cli/azure/provider?view=azure-cli-latest#az-provider-register)

>Register a provider.

**Example 1:** Register a resource provider

``` powershell
PS C:\> az provider register --namespace 'Microsoft.AnalysisServices'
```
