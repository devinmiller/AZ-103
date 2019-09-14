# Managing Resource Groups

Training materials for the AZ-103 certification exam

## Links

## Introduction

A _Resource Group_ is a container that holds related resources for an Azure solution.  It can include all the resources for the solution, or only those resources that you want to manage as a group.  They allow for the organization of resources in Azure.

### Resource Group Rules

- Resources in a resource group should share the same lifecycle
- Each resource can only exist in one resource group
- Resources can be added or removed to a resource group at any time
- Resources can be moved from one resource group to another
- Resource groups can contain resources that reside in different regions
- Resources can interact with resources in other resource groups

Resource groups are controlled by four mechanisms.

- Tags
  - Text associated with the resource group itself to categorize it
- Locks
  - Prevents accidental deletion and/or changes to resources within the resource group
- Access Control (IAM)
  - Gives users access to the different resources with the resource group
- Policies
  - Controls a certain kind of behavior and/or effect within that resource group

### Creating Resource Groups

Resource groups can be created through the Azure portal, with PowerShell, or with the Azure CLI.

[Creating and Managing Resources Using PowerShell](Groups/groups-powershell.md)

[Creating and Managing Resources Using Azure CLI](Groups/groups-cli.md)

### Access Control (IAM)

A system that provides fine-grained access management of resources in Azure.  Grant only the amount of access to users needed to perform their jobs.

Only the _Owner_ role can assign access to resources.  

More on assigning roles can be found under [Manage Access Control](../Manage%20Access%20Control)

## Skills

### Use Azure Policies for Resource Groups

Allows you to manage and prevent IT issues with policy definitions that enforce rules and effects for your resources.  Policies allow you to keep compliant with corporate standards and SLAs.  

### Configure Resource Locks

Resource locks prevent accidental deletion or changes to resources in resource groups.  Consists of two locks: CanNotDelete and ReadOnly.

[Creating and Managing Locks Using PowerShell](Groups/group-powershell.md#Resource%20Lock%20Commands)

[Creating and Managing Locks Using Azure CLI](Groups/group-cli.md#Resource%20Lock%20Commands)

### Configure Resource Policies

More on configuring policies can be found under [Configure Azure Subscription Policies at Azure Subscription Level](../Manage%20Subscriptions/README.MD#Configure%20Azure%20Subscription%20Policies%20at%20Azure%20Subscription%20Level)

### Identify Auditing Requirements

### Implement and Set Tagging on Resource Groups

Azure resource tags logically organize resources.  Each tag has a name and a value.  Allows related resources from different resource groups to be identified.  Organize by billing, management, or pretty much anything.

[Creating and Managing Resources Using PowerShell](Groups/groups-powershell.md)

[Creating and Managing Resources Using Azure CLI](Groups/groups-cli.md)

#### Tag Rules

- Tags are not inherited
  - Tags applied to a resource group are not inherited by the resources themselves
  - There are scripts available that will apply resource group tags to the resources
- There is a limit of 15 tag name/value pairs
- Names can't contain these characters: <, >, %, &, \, ?, /
- Tags can't be applied to classic resources
- Tag name is limited to 512 characters
- Tag value is limited to 256 characters

### Move Resources Across Resource Groups

- Not all resources can be moved, verify first
- Can move resources to a resource group in a different location
- Can create the new resource group at the same time as the move

### Remove Resource Groups

- Deleting a resource group deletes all of the resources inside of it, permanently
  - This is why locks can be helpful
