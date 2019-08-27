# Tag Resources Using Azure CLI

Commands for managing tags using Azure CLI.

## Commands

### **[az resource show](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-show)**

>Get the details of a resource.

**Example 1:** Show the tags for a Virtual Machine resource named _'vmwebprod001_'

``` powershell
PS C:\> az resource show -g web-prod-rg -n vmwebprod001 --resource-type "Microsoft.Compute/virtualMachines" --query tags
```

### **[az resource list](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-list)**

>List resources.

**Example 1:** Get all resources with the tag _'dept'_.

``` powershell
PS C:\> az resource list --tag dept
```

**Example 2:** Get all resources with the tag _'dept'_ that have the value _'IT'_.

``` powershell
PS C:\> az resource list --tag dept=IT
```

### **[az resource tag](https://docs.microsoft.com/en-us/cli/azure/resource?view=azure-cli-latest#az-resource-tag)**

>Tag a resource.

**Example 1:** Tag the virtual machine resource _'vmwebprod001'_ with the key _'dept'_ and value _'IT'_

``` powershell
PS C:\> az resource tag --tags dept=IT -g web-prod-rg -n vmwebprod001 --resource-type "Microsoft.Compute/virtualMachines"
```
