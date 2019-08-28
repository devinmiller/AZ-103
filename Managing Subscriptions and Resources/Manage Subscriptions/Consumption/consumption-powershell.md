# View Resource Consumption and Billing with PowerShell

Commands for viewing resource consumption and billing using PowerShell.

## Commands

### [Get-AzBillingInvoice](https://docs.microsoft.com/en-us/powershell/module/az.billing/get-azbillinginvoice?view=azps-2.6.0)

>Get billing invoices of the subscription.

**Example 1:** Download a billing invoice

``` powershell
PS C:\> $Invoice = Get-AzBillingInvoice -Latest
PS C:\> Invoke-WebRequest -uri $Invoice.downloadurl -outfile "$($Invoice.name).pdf"
```
