resource "azurerm_key_vault" "mykeyvault" {
  name                = "mykeyvault"
  location            = "westus"
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  sku_name           = "standard"
  tenant_id          = data.azurerm_client_config.example.tenant_id
  tags               = {}
}