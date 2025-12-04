resource "azurerm_storage_account" "abc123" {
  name                     = "abc123"
  location                 = "eastus"
  resource_group_name      = azurerm_resource_group.example.name
  account_tier            = "Standard"
  account_replication_type = "LRS"
  tags                    = {
    environment = "production"
  }
}