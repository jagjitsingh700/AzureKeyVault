Connect-AzureRmAccount

# 1.Creating a new Azure Key Vault in Azure
New-AzureRmKeyVault `
    -VaultName 'MySecrets' `
    -ResourceGroupName 'playground-demo-rg' `
    -Location 'northeurope'

# 2.Convert our secret value to a Secure String
$secretValue = ConvertTo-SecureString `
    -String 'jdbc:sqlserver://systemx-prod-sql.database.windows.net:1433;database=systemx-db;user=operation@systemx-db-sql;password=Password123#%!89(7);encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.db.windows.net;loginTimeout=30;' `
    -AsPlainText
    -Force

# 3. Add the Secure String to our new Azure Key Vault
$secret = Set-AzureKeyVaultSecret `
    -VaultName 'MySecrets' `
    -Name 'DBConnection' `
    -SecretValue $secretValue