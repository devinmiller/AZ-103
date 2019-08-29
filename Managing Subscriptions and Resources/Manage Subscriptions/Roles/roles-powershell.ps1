#Login-AzAccount

# Create a custom role definition
# Example: Add-RoleDefinition "role-definition.json"
function Add-RoleDefinition {
    param(
        $FileName
    )

    $FilePath = Get-ChildItem -Path $FileName -Recurse -Force | Select-Object -ExpandProperty FullName
    
    $Subscription = Get-AzSubscription | Select-Object -ExpandProperty  Id
    
    (Get-Content -Path $FilePath -Raw) -replace "\[SUBSCRIPTION ID\]", $Subscription | Set-Content "policy-rule-temp.json"
    
    New-AzRoleDefinition -InputFile "policy-rule-temp.json"
}