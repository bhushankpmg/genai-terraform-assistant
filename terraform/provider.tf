provider set up and that you have a resource group in place.

### Prerequisites
- Terraform installed on your local machine.
- An Azure account and the Azure CLI installed and configured.
- A resource group where the storage account will be created.

### Terraform Configuration

```hcl
# Specify the provider
provider "azurerm" {
  features {}