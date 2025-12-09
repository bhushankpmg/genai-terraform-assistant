module "vnet_dev" {
    source              = "../../modules/virtual_network"
    vnet_name          = "dev-vnet"
    address_space       = ["10.0.0.0/16"]
    location           = "East US"
    resource_group_name = azurerm_resource_group.example.name
}