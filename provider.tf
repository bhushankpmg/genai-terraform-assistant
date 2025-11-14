provider configured and that you have already authenticated to your Azure account.

### Prerequisites
Make sure you have:
- Terraform installed
- An Azure account
- The Azure CLI or Azure service principal for authentication if needed

### Terraform Configuration

1. Create a new directory for your Terraform project.
2. Inside that directory, create a file named `main.tf` and add the following configuration:

```hcl
provider "azurerm" {
  features {}