To configure the Azure provider in Terraform, you'll need to specify the provider and its required version in your Terraform configuration. Below is a basic example of how to set up the Azure provider in a Terraform configuration file.

1. **Create a directory for your Terraform configuration:**

   ```
   mkdir terraform-azure
   cd terraform-azure
   ```

2. **Create a Terraform configuration file, e.g., `main.tf`:**

   ```hcl
   # Specify the required Terraform version
   terraform {
     required_providers {
       azurerm = {
         source  = "hashicorp/azurerm"
         version = "~> 3.0"  # Replace with the desired version
       }
     }

     required_version = ">= 1.0"
   }

   # Configure the Azure provider
   provider "azurerm" {
     features {}  # Required features block (can be left empty)
   }

   # Example resource: Create a resource group
   resource "azurerm_resource_group" "example" {
     name     = "example-resource-group"
     location = "East US"
   }
   ```

3. **Initialize the Terraform configuration:**

   Run the following command in your terminal:

   ```sh
   terraform init
   ```

   This command initializes the Terraform configuration and downloads the necessary provider plugins.

4. **Authentication:**

   To authenticate with Azure, you can use one of several methods. The most common method for local development is using the Azure CLI:

   1. Log in to your Azure account using the Azure CLI:

      ```sh
      az login
      ```

   2. Ensure that you have set the correct subscription context if you have multiple subscriptions:

      ```sh
      az account set --subscription "Your Subscription Name"
      ```

   Alternatively, you can set the following environment variables to authenticate using a service principal:

   ```sh
   export ARM_CLIENT_ID="your-client-id"
   export ARM_CLIENT_SECRET="your-client-secret"
   export ARM_SUBSCRIPTION_ID="your-subscription-id"
   export ARM_TENANT_ID="your-tenant-id"
   ```

5. **Plan and apply your configuration:**

   You can generate an execution plan using:

   ```sh
   terraform plan
   ```

   If everything looks good, you can apply the configuration:

   ```sh
   terraform apply
   ```