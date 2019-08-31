# Manage Azure Subscriptions

Training materials for the AZ-103 certification exam.

## Links

[Add or Change Azure Subscription Administrators](https://docs.microsoft.com/en-us/azure/billing/billing-add-change-azure-subscription-administrator)

[Prevent Unexpected Charges with Azure Billing and Cost Management](https://docs.microsoft.com/en-us/azure/billing/billing-getting-started)

[Overview of the Azure Policy Service](https://docs.microsoft.com/en-us/azure/governance/policy/overview)

## Skills

### Assign Administrator Permissions

Managing administrator permissions for Azure subscriptions is done through the _Subscriptions_ service under the _Access Control (IAM)_ option in the Azure portal.

#### Role-Based Access Control (RBAC)

Role-based access control (RBAC) provides the ability to delegate the administration of Azure resources depending on security requirements.  Roles in Azure organize related resource permissions together.  For example, roles for managing virtual machines will have a different set of permissions than roles for managing storage accounts.

This topic is covered in detail in the [Role Based Access Control (RBAC)](..\Manage%20Access%20Controll) section.

### Configure Cost Center Quotas and Tagging

#### [Spending Limits](https://docs.microsoft.com/en-us/azure/billing/billing-spending-limit)

Spending limits help prevent usage of credits beyond what is available in a subscription.  

They only apply to the follow subscriptions types

- Free Trial
- Visual Studio
- MSDN

They do not apply to the following subscription types

- Support Plans
- Enterprise Dev/Test
- Pay-As-You-Go

If a spending limit is exceeded, the following happens

1. An email message is sent to the resource owner
1. Deployed resources are disabled until the next billing cycle
1. Database and storage accounts become read-only

Spending limits can be removed by create a subscription payment method.

#### [Azure Consumption APIs](https://docs.microsoft.com/en-us/azure/billing/billing-consumption-api-overview)

The Azure consumption APIs return resource usage details and cost through REST API calls.

The following subscription types are supported

- Enterprise Enrollments
- Web Direct Subscription

API Name|Description
--- | ---
Price Sheet <br/> _(Enterprise customers only)_ | Resource usage and pricing expressed using various units of measurement such as hour, GB
Reservation Summaries | Summary of reserved virtual machine instance reserved consumption vs. actual usage
Reservation Details | Reserved virtual machine usage
Reservation Recommendations | Suggested reserved virtual machine instance usage and saving
Budgets <br/> _(Enterprise customers only)_ | Manage cost and usage budgets and alerts
Balance <br/> _(Enterprise customers only)_ | Current or previous billing summary
Marketplace Charges | Marketplace resource usage and fee details
Usage Details | Resource usage and fee details

#### Cost Management and Billing

Microsoft recommends three approaches for tracking and managing costs within Azure.

1. Organizing resources within _Resource Groups_.
1. Organizing resources by applying _Tags_.
1. Organizing resources through multiple _Subscriptions_.

In larger enterprises, resources can also be further organized using Azure [management groups](https://docs.microsoft.com/en-us/azure/governance/management-groups/).

>Azure management groups provide a level of scope above subscriptions. You organize subscriptions into containers called "management groups" and apply your governance conditions to the management groups. All subscriptions within a management group automatically inherit the conditions applied to the management group. Management groups give you enterprise-grade management at a large scale no matter what type of subscriptions you might have.

Billing alerts can be added to a _Subscription_ through the account management page.  The alert will send a notification email when the selected billing total is exceded.

[Azure Reservations](https://docs.microsoft.com/en-us/azure/billing/billing-save-compute-costs-reservations)

>Azure Reservations help you save money by pre-paying for one-year or three-years of virtual machines, SQL Database compute capacity, Azure Cosmos DB throughput, or other Azure resources. Pre-paying allows you to get a discount on the resources you use.

Other Tools For Cost Management

- [Microsoft Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)
- [Microsoft Azure Advisor Cost Recommendations](https://docs.microsoft.com/en-us/azure/advisor/advisor-cost-recommendations)

#### Tagging

Tags are key/value pairs that function as additional metadata associated with Azure resources for easier management.  Tags be assigned both programmatically or through the portal.  

When viewing the _Cost Analysis_ blade of the _Subscription_ service, resource costs can be filtered by tags.  Tags can provide a means of cost management in the Azure portal, but rely on diligently, and correctly, being assigned to resources.

[Tagging Resources Using PowerShell](Tags/tags-powershell.md)

[Tagging Resources Using Azure CLI](Tags/tags-cli.md)

### Configure Azure Subscription Policies at Azure Subscription Level

The Azure _Policy_ service can be used to create, manage, as assign policies across Azure subscriptions, resource groups, or specific resources.  Exclusions can also be defined that apply to specific nested resource groups or resources.

A policy defines different rules and effects over resources, such as allowed geographic regions or required tags, so those resources stay compliant with business requirements or standards.  This is often referred to as _cloud governance_ and Azure policies are used to ensure enforcement by controlling resource deployment and usage.

There are a number of pre-defined policies available covering common requirements.  For more granular control over requirements, custom policies can be created.  Custom policies can be created manually, by copying and modifying an existing policy, or by importing a custom policy from an external source, such as GitHub.

A policy can have effects that are declared within the policy definition.

| Effect | Description |
| --- | --- |
| Append | Resource property additions including tags |
| Audit | Logging only; generates a warning |
| AuditIfNotExists | Audit is enabled if resource does not exist |
| Deny | Existing non-compliant resources are marked as non-compliant, but not deleted |
| DeployIfNotExists | If the resource does not already exist, deploy it |

It is a best practice to start with an audit effect instead of a deny effect to determine the impact of the policy definition.

Any policies put into effect apply to both new _and_ existing resources.  Be aware that resources are scanned hourly for compliance with policies, so changes to a policy may not be effective immediately.

In larger enterprises, an Azure _Policy Initiative_ can be used to group multiple policies into a single item with an overarching governance goal.  This can greatly simplify managing and assigning policy definitions, especially when combined with management groups.

[Creating and Assigning Policies Using PowerShell](Policies/policies-powershell.md)

[Creating and Assigning Policies Using Azure CLI](Policies/policies-cli.md)

### Manage Microsoft Azure Resource Providers

Resource providers enable Microsoft Azure features.  Most providers are automatically registered with a subscription, but occasionally new providers need to be registered to expose additional functionality.

For example
Registered Automatically | Not Registered Automatically
--- | ---
Microsoft.Network | Microsoft.PolicyInsights
Microsoft.Sql | Microsoft.AzureActiveDirectory
Microsoft.Storage | Microsoft.AzureStack
Microsoft.Compute | Microsoft.Botservice

Resource providers can be viewed in the _Subscription_ service in the _Resource Providers_ blade.

[Managing Resource Providers Using PowerShell](Providers/providers-powershell.md)

[Managing Resource Providers Using Azure CLI](Providers/providers-cli.md)
