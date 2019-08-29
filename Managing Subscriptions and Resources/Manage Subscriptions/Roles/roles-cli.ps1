#Login-AzAccount

# Create a custom role definition
# Example: Add-RoleDefinition "role-definition.json"
function Add-PolicyDefinition {
    param (
        $FileName
    )

    $FilePath = Get-ChildItem -Path $FileName -Recurse -Force | Select-Object -ExpandProperty FullName
    $Subscription = az account list --query "[].id |[0]" --output tsv
    (Get-Content -Path $FilePath -Raw) -replace "\[SUBSCRIPTION ID\]", $Subscription | Set-Content "policy-rule-temp.json"

    az role definition create --role-definition @policy-rule-temp.json
}
