#Login-AzAccount


$filePath = Get-ChildItem -Path "policy-rule.json" -Recurse -Force | Select-Object -ExpandProperty FullName

New-AzPolicyDefinition -Name "Default tag and value" -Metadata '{"category": "Cost Management"}' -Policy $filePath
