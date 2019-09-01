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

Only the Owner and User Access Administrator roles have permission to create custom roles.

Use when existing roles don't meet your organization's needs.

Can be shared across subscriptions.

Each Azure AD instance can host up to 2000 custom roles.

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

#### Actions

Specifies the managements operations that the role allows to be performed.  Collection of operations strings that identify securable operations or specific Azure resource providers.

#### NotActions

Specifies the management operations that are excluded from the allowed actions.  Used when it is simpler to exclude actions a principal can perform rather than instead of listing all the allowed actions.

- NotActions _does not_ function as a deny rule
- A principle in multiple roles, where one role has an operation in Actions, and NotActions in another, will be able to perform the the operation.

#### DataActions

Permissions for data operation that can be performed on data with the scope of the permission.

- View a blob or a list of blobs
- view message or message in a storage queue

#### NotDataActions

Data operations that are excluded from DataActions.  Used when it is simpler to exclude actions a principal can perform rather than instead of listing all the allowed actions.

- NotDataActions _does not_ function as a deny rule
- A principle in multiple roles, where one role has an operation in DataActions, and NotDataActions in another, will be able to perform the the operation.

#### AssignableScopes

Specifies the scope where the role can be assigned.  Makes the role only available in subscriptions or resource groups that will use it, and not visible in subscriptions or resource groups that will not.

#### Validatoin

Why validate custom roles?

- Role may be under-permissioned
  - Principals can't perform the tasks that they need to perform
  - Processes associated with principals fail because they cannot complete
- Role may be over-permissioned
  - Principals can perform tasks that they shouldn't be able to perform
  - Presents a security risk

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

#### Common RBAC Issues

- Overpermissioning
  - A user or group is given more permissions that is necessary to a resource
  - Evident when a user or members of a group are able to perform tasks they should not be able to perform
  - Also happens when principals are assigned an inappropriate role
  - Happens when a custom role is incorrectly configured

- Underpermissioning
  - A user, group, or service principal is given fewer permissions that is necessary for a resource
  - Evident when a user, group member, or service principal is unable to perform a task that they should be able to perform
  - Happens when users are assigned an inappropriate role
  - Happens when a custom role is incorrectly configured

- Too broad a scope
  - A user, group or service principal has permissions to resources they should not have been assigned
  - Need to ensure that resources are in appropriate resource groups
  - Organizations are increasingly moving sensitive securables into separate subscriptions and even using separate management groups to meet compliance requirements

- Too narrow a scope
  - A user, group or service principal has appropriate permissions to some resources but not all the resources required for their task
  - Can happen when resources associated with a workload are spread across multiple resource groups or subscriptions

- RBAC Changes Not Detected
  - Azure Resource Manager sometimes caches configurations and data to improve performance
  - When creating or deleting role assignments, it can take up to 30 minutes for changes to take effect
  - If using the Azure portal, Azure PowerShell, or Azure CLI, you can force a refresh of role assignment changes by signing out and signing in
  - If making role assignment changes with REST API calls, you can force a refresh by refreshing the access token

#### RBAC Tips and Tricks

- Avoid role assignments at the resource level
- Use built in roles where possible
- Assign access to groups and not users
- Avoid using microsoft accounts
- Use RBAC with Service Principals
