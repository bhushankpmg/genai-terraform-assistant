Certainly! Below is a Terraform configuration to create an Azure Storage Account with the specified details:

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "myresourcegroup"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "myuniquestorageacct" # Storage account name must be globally unique
  resource_group_name      = azurerm_resource_group.example.name
  location                = azurerm_resource_group.example.location
  account_tier            = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "Demo"
  }
}
```

### Explanation:
1. **Provider Configuration**: The `provider "azurerm"` block is used to declare that you are using the Azure Resource Manager provider.

2. **Resource Group**: The `azurerm_resource_group` resource creates a resource group named `myresourcegroup` in the `West Europe` region.

3. **Storage Account**: The `azurerm_storage_account` resource is defined to create the storage account:
    - The `name` attribute is set to the desired unique storage account name, `myuniquestorageacct`.
    - The `resource_group_name` attribute links the storage account to the previously created resource group.
    - The `location` attribute specifies where the storage account will be created, using the location of the resource group.
    - The `account_tier` is set to `Standard`, and the `account_replication_type` is set to `LRS` (Locally Redundant Storage).
    - The `tags` attribute allows you to apply tags to the storage account for better organization.

### How to Use:
1. Save the code to a file, e.g., `main.tf`.
2. Initialize Terraform with `terraform init`.
3. Validate the configuration with `terraform validate`.
4. Create the resources with `terraform apply`.

Make sure to replace `myuniquestorageacct` with a truly unique name as Azure storage account names must be globally unique. Adjust the `tags` and other settings based on your requirements.