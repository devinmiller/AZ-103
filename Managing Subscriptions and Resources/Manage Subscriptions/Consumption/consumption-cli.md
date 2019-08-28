# View Resource Consumption and Billing with Azure CLI

Commands for viewing resource consumption and billing using PowerShell.

## Commands

### [az billing invoice list](https://docs.microsoft.com/en-us/cli/azure/billing/invoice?view=azure-cli-latest)

>Get billing invoices for a subscription.

**Example 1:** Download a billing invoice

``` powershell
PS C:\> $InvoiceName = az billing invoice list --query "[].name | [0]" --output tsv
PS C:\> $InvoiceDetails = az billing invoice show --name $InvoiceName | ConvertFrom-Json
PS C:\> Invoke-WebRequest -uri $InvoiceDetails.downloadurl.url -outfile "$($InvoiceDetails.name).pdf"
```
