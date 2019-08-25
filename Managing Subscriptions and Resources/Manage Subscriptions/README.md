# Manage Azure Subscriptions

Training materials for the AZ-103 certification exam.

## Links

[Add or Change Azure Subscription Administrators](https://docs.microsoft.com/en-us/azure/billing/billing-add-change-azure-subscription-administrator)

[Prevent Unexpected Charges with Azure Billing and Cost Management](https://docs.microsoft.com/en-us/azure/billing/billing-getting-started)

[Overview of the Azure Policy Service](https://docs.microsoft.com/en-us/azure/governance/policy/overview)

## Skills

### Assign Administrator Permissions

Managing administratior permissions for Azure subscriptions is done through the _Subscriptions_ service under the _Access Control (IAM)_ option in the Azure portal.

### Configure Cost Center Quotas and Tagging

Tags are key/value pairs that function as additional metadata associated with Azure resources for easier mangement.

Tags can be filtered in the _Tags_ service through the Azure portal.

Microsoft recommends three approaches for tracking and managing costs within Azure.

1. Organizing resources wtihin _Resource Groups_.
1. Organizing resources by applying _Tags_.
1. Organizing resources through multiple _Subscriptions_.

In larger enterprises, resources can also be further organized using Azure [management groups](https://docs.microsoft.com/en-us/azure/governance/management-groups/).

>Azure management groups provide a level of scope above subscriptions. You organize subscriptions into containers called "management groups" and apply your governance conditions to the management groups. All subscriptions within a management group automatically inherit the conditions applied to the management group. Management groups give you enterprise-grade management at a large scale no matter what type of subscriptions you might have.

Billing alerts can be added to a _Subscription_ through the account management page.  The alert will send a notification email when the selected billing total is exceded.

[Tagging Resources Using PowerShell](Tags/tags-powershell.md)

[Tagging Resources Using Azure CLI](Tags/tags-cli.md)

### Configure Azure Subscription Policies at Azure Subscription Level

The Azure _Policy_ service can be used to create, manage, as assign policies across Azure subscriptions, resource groups, or specific resources.  Exclusions can also be defined that apply to specific nested resource groups or resources.

A policy defines different rules and effects over resources, such as allowed geographic regions or required tags, so those resources stay compliant with business requirements or standards.  This is often referred to as _cloud governance_ and Azure policies are used to ensure enforement by controlling resource deployment and usage.

There are a number of pre-defined policies avaiable covering common requirements.  For more granular control over requirements, custom policies can be created.  Custom policies can be created manually, by copying and modifying an existing policy, or by importing a custom policy from an external source, such as GitHub.

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
