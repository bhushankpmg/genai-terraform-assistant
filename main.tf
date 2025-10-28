To create an Azure Storage Account using Terraform, you'll need to define a configuration that specifies the required resources. Here's a simple example of a Terraform configuration file that creates an Azure Storage Account with the specified name, in the specified resource group and location.

You can create a file called `main.tf` and add the following configuration:

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "myresourcegroup"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "myuniquestorageacct"
  resource_group_name     = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier            = "Standard"
  account_replication_type = "LRS"

  # Optional: Enable HTTPS
  enable_https_traffic_only = true

  # Optional: Enable Blob versioning
  blob_properties {
    versioning_enabled = true
  }

  # Optional: Add tags
  tags = {
    Environment = "Demo"
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}
```

### Explanation:
- **provider "azurerm"**: This block configures the Azure provider.
- **resource "azurerm_resource_group" "example"**: This block creates a resource group named `myresourcegroup` in the `West Europe` region.
- **resource "azurerm_storage_account" "example"**: This block creates a storage account named `myuniquestorageacct` in the specified resource group and location.
  - `account_tier`: The performance tier, can be "Standard" or "Premium".
  - `account_replication_type`: The replication type, in this case "LRS" (Locally Redundant Storage).
  - `enable_https_traffic_only`: Ensures that only HTTPS requests are allowed.
  - Additional properties like Blob versioning and tags can be added as per your requirements.
- **output "storage_account_name"**: This outputs the name of the storage account after deployment.

### Steps to Deploy

1. **Initialize Terraform**: Run the following command to initialize Terraform and download the necessary provider plugins.
    ```bash
    terraform init
    ```

2. **Plan the Deployment**: Run this command