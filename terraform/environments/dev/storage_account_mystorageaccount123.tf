resource "azurerm_storage_account" "mystorageaccount123" {
  name                     = "mystorageaccount123"
  location                 = "eastus"
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  account_tier            = "Standard"
  account_replication_type = "LRS"
  tags                    = {
    environment = "development"
    owner       = "user"
  }
}