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

[Creating and Managing Resources Using PowerShell](groups-powershell.md)

[Creating and Managing Resources Using Azure CLI](groups-cli.md)

## Skills

### Use Azure Policies for Resource Groups

### Configure Resource Locks

### Configure Resource Policies

### Identify Auditing Requirements

### Implement and Set Tagging on Resource Groups

### Move Resources Across Resource Groups

### Remove Resource Groups
