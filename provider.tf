To set up a Terraform provider configuration for Azure, you'll need to specify the Azure Resource Manager (ARM) provider in your Terraform configuration file. Below is a basic example of how to configure the Azure provider in `main.tf`. This example assumes you have Azure CLI installed and you can authenticate using it.

```hcl
# main.tf

# Specify the required Terraform version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # You can specify the version you need
    }
  }

  required_version = ">= 1.0"
}

# Configure the Azure Provider
provider "azurerm" {
  features {}  # Keep this empty for now - it enables all features
}

# Example resource: Create a Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "East US"
}
```

### Steps to Use This Configuration

1. **Install Terraform**: Make sure you have Terraform installed. You can download it from [terraform.io](https://www.terraform.io/downloads.html).

2. **Authenticate with Azure**: Use the Azure CLI to log in:
   ```bash
   az login
   ```

3. **Create the configuration file**: Save the above example in a file named `main.tf`.

4. **Initialize Terraform**: Navigate to the directory containing `main.tf` and run:
   ```bash
   terraform init
   ```

5. **Plan the deployment**: This command shows you what will be created:
   ```bash
   terraform plan
   ```

6. **Apply the deployment**: Actually create the resources defined in your Terraform file:
   ```bash
   terraform apply
   ```

7. **Confirm the apply**: Type `yes` when prompted to confirm the changes.

### Optional: Configuring Authentication

If you prefer not to use Azure CLI for authentication, you could also configure the provider using service principal credentials. Here's how you would do that:

```hcl
provider "azurerm" {
  features {}

  client_id       = "<YOUR_CLIENT_ID>"
  client_secret   = "<YOUR_CLIENT_SECRET>"
  tenant_id       = "<YOUR_TENANT_ID>"
  subscription_id = "<YOUR_SUBSCRIPTION_ID>"
}
```

Replace the placeholders with your