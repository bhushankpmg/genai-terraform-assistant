provider in Terraform and authenticated with Azure for the current session.

First, make sure you have the following prerequisites:
- Terraform installed on your machine.
- Azure CLI installed and configured to access your Azure account.
- An active Azure subscription.

Here's a simple Terraform script to create an Azure Storage Account:

```hcl
provider "azurerm" {
  features {}