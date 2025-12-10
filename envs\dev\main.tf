module "virtual_machine_dev" {
    source                = "../../modules/virtual_machine"
    vm_name              = "kpmgvmdev"
    resource_group_name   = azurerm_resource_group.example.name
    location             = azurerm_resource_group.example.location
    vm_size             = "Standard_DS1_v2"
    admin_username       = "azureuser"
    admin_ssh_key       = file("~/.ssh/id_rsa.pub")
}