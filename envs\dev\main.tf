module "storage_dev" {
    source = "../../modules/storage_account"
    sa_name = "kpmgdemo"
    location = "East US"
    account_tier = "Standard"
}