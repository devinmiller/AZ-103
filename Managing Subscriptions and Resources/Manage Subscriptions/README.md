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

Billing alerts can be added to a _Subscription_ through the account management page.  The alert will send a notification email when the selected billing total is exceded.

[Tagging Resources Using PowerShell](tags/tags-powershell.md)

[Tagging Resources Using Azure CLI](tags/tags-cli.md)

### Configure Azure Subscription Policies at Azure Subscription Level

The Azure _Policy_ service can be used to define policies that will enforce standards and SLAs across all resources or a specific resource.  There are numerous pre-defined policies available.  A custom policy definition can be created to suit specific requirements not provided by the available policies.

Examples of pre-defined policies.

- Allowed Locations.
- Allowed Resource Types.
- _Not_ Allowed Resource Types.
- Apply Tag and Its Default Value.
- Enforce Tag and Its Value
