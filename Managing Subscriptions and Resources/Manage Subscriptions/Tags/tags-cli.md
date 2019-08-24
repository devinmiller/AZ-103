# Tag Resources Using Azure CLI

Commands for managing tags using Azure CLI.

## Commands

### **[az resource show](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-show)**

>Get the details of a resource.

#### Examples

Show the tags for a Virtual Machine resource named _'vmwebprod001_'

``` ps1
PS C:\> az resource show -g web-prod-rg -n vmwebprod001 --resource-type "Microsoft.Compute/virtualMachines" --query tags
```

### **[az resource list](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-list)**

>List resources.

#### Examples

Get all resources with the tag _'dept'_.

``` ps1
PS C:\> az resource list --tag dept
```

Get all resources with the tag _'dept'_ that have the value _'IT'_.

``` ps1
PS C:\> az resource list --tag dept=IT
```

### **[az resource tag](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-tag)**

>Tag a resource.

#### Examples

Tag the virtual machine resource _'vmwebprod001'_ with the key _'dept'_ and value _'IT'_

``` ps1
PS C:\> az resource tag --tags dept=IT -g web-prod-rg -n vmwebprod001 --resource-type "Microsoft.Compute/virtualMachines"
```
