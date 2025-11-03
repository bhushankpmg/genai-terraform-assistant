provider block for Azure and the necessary resources for the storage account. Below is a simple example of a Terraform configuration file that accomplishes this.

First, ensure you have the latest version of Terraform installed, and you have your Azure credentials set up.

### Example Terraform Configuration

Create a file named `main.tf` with the following content:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # You can use the latest version available
    }