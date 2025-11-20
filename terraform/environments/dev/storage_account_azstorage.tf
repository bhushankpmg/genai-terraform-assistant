resource "azurerm_storage_account" "azstorage" {
  name                     = "azstorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type  = "LRS"
  tags                     = {}
}