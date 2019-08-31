# Manage Role Based Access Control (RBAC)

Training materials for the AZ-103 certification exam.

## Links

[Role-Based Access Control (RBAC)](https://docs.microsoft.com/en-us/azure/role-based-access-control/)

[Azure Resource Manager Resource Provider Operations](https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations)

[Manage Access to Azure Management with Conditional Access](https://docs.microsoft.com/en-us/azure/role-based-access-control/conditional-access-azure-management)

## Introduction

### What is Role Based Access Control

Role based access control is about determining what you can do and where you can do it.

A _Security Principal_ represents an individual, collection of individuals, an application or service that requires access to an Azure resource.  

- Individuals are represented as Azure AD users and users in other tenancies
- Collections of individuals are represented by Azure AD groups
- Applications and services are represented by service principals

A _Role Definition_ is generally just referred to as a role.

- A collection of permissions, expressed as a set of operations that can be performed
  - For example: Read, Write, Delete

A _Scope_ is a boundary to which a role definition applies.

A scope can be assigned at the following levels

- Management Group
- Subscription
- Resource Group
- Resource

Scopes exist in a parent-child relationship, so access at a parent scope is inherited at the child scope.

### Why Azure Role Based Access Control

- Ensure that the principle of least privilege is used
  - Only required access is granted
  - Minimize damage during account compromise
- Reduce chance of unauthorized actions being performed
- Reduce chance of accidental actions being performed

Using role based access control is a best practice, but requires work to implement effectively.  In small subscription using role based access is probably overkill.  In large subscriptions, where multiple people are working in parallel, it becomes much more important.

## Skills

### Create a Custom Role

#### Management Operations

Specified in the _Actions_ and _NotActions_ properties of a role definition.

For Example:

- Manage access to storage account
- Create, update, or delete a blob container
- Delete a resource group and its content

#### Data Operations

Specified in the _DataActions_ and _NotDataActions_ properties of a role definition.

For Example:

- Read a list of blobs in a container
- Write to a storage blob in a container
- Delete a message in a queue

[Creating Custom Role Definition Using PowerShell](Roles/roles-powershell.md)

[Create Custom Role Definitions Using Azure CLI](Role/roles-cli.md)

### Configure Access to Azure Resources by Assigning Roles

A _Role Assignment_ is comprised of three components

Component | Description
--- | ---
Security Principal | Identity to which the permissions will apply
Role Definition | Collection of permissions
Scope | Where the access applies

#### Built-In Roles

There are four fundamental RBAC roles.

Name | Description
--- | ---
Owner | Manages everything including access to resources
Contributor | Manages everything except access to resources
Reader | Read only access to everything
User Access Administrator | Manage user access to Azure resources

#### RBAC Limits

- A maximum of 2000 role assignments per Azure subscription
- A maximum of 2000 custom roles per tenant

#### RBAC Auditing

Track what changes are made to role assignments and definitions.

When a change is made to a role assignment or role definition with a subscription, details of those changes are written to the Azure Activity Log.

- Azure Activity Log can be directly queried for 90 days
- Activity Log data can be stored for longer

The following RBAC operations are written to the Azure Activity Log

- Create role assignment
- Delete role assignment
- Create or update custom role definition
- Delete custom role definition

#### Azure AD Administrator Roles Vs Azure RBAC Roles

Azure AD Admin Roles are different from Azure RBAC Roles.

- Use _Azure RBAC Roles_ to manage permissions to Azure resources.
- Use _Azure AD Administrator Roles_ to manage permission to Azure AD resources.

Azure RBAC Roles | Azure AD Administrator Roles
--- | ---
Used to manage access to Azure resources | Used to manage access to Azure Active Directory resource
Can create custom roles | Can only use built-in roles
Scopes can be configured at multiple levels |  Only scoped at the tenant level
Access role information using Azure portal, Azure CLI, Azure PowerShell, Azure ARM templates, REST API | Access role information through Azure portal Office 365 admin portal, Microsoft Graph, Azure AD PowerShell

Azure RBAC and Azure AD admin roles don't overlap by default.  An Azure AD global admin can manage Azure subscriptions and management groups.  An Azure AD global administrator is given the User Access Administrator RBAC role for all subscriptions associated with a tenant. An Azure AD global administrator effectively has complete control over Azure RBAC.

### Configure Management Access to Azure, Troubleshoot RBAC, Implement RBAC Policies, Assign RBAC Roles

#### Azure Management and Conditional Access

Restrict management of Azure using _Conditional Access_ policies.  Requires Azure AD P2.

Applies to all Azure Management Endpoints

- Azure Portal
- Azure Provider
- Azure PowerShell
- Azure CLI

Condition | Description
--- | ---
Sign-in Risk | Calculation performed to determine whether a sign-in attempt wasn't made by the owner of an Azure account
Device Platform | Android / iOS / Windows / MacOS
Device State | Hybrid Azure AD joined / Marked as compliant
Locations | Any location / All trusted locations / Selected locations

#### Azure Policies and RBAC

Azure _Policy_ Overview

- Enforce different rules and effects over resources
- Can control the types of resources that can be deployed
- Can be used to verify whether a particular resource exists and to deploy the resource if it is not present using a template

Azure RBAC focuses on what can be done within a scope

- Allow a service to deploy a VM
- Allow members of a group to start a VM

Azure Policies control the specifics of what is done at a particular scope

- Which VM SKUs can be deployed
- How resources such as VMs are named
