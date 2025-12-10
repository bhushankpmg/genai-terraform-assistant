output "storage_account_id" {
    value       = azurerm_storage_account.sa.id
    description = "The ID of the created storage account."
}