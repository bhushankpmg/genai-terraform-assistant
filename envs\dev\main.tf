module "storage_dev" {
    source                  = "../../modules/storage_account"
    sa_name                 = "devstor123"
    location                = "East US"
    account_tier           = "Standard"
    account_replication_type = "LRS"
    resource_group_name     = "rg-dev-001"
}