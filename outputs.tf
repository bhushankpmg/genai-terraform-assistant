In Azure, when you create a Storage Account using an Infrastructure as Code tool like ARM templates, Terraform, or Bicep, you can define outputs that capture the Storage Account ID and endpoint. The specific syntax will depend on the tool you're using. Below are examples for ARM templates, Terraform, and Bicep.

### ARM Template Example
In an ARM template, you can define an output section to capture the Storage Account ID and endpoint as follows:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2021-04-01",
      "name": "[parameters('storageAccountName')]",
      "location": "[parameters('location')]",
      "sku": {
        "name": "Standard_LRS"
      },
      "kind": "StorageV2",
      "properties": {}
    }
  ],
  "outputs": {
    "storageAccountId": {
      "type": "string",
      "value": "[resourceId('Microsoft.Storage/storageAccounts', parameters('storageAccountName'))]"
    },
    "storageAccountEndpoint": {
      "type": "string",
      "value": "[concat('https://', parameters('storageAccountName'), '.blob.core.windows.net/')]"
    }
  }
}
```

### Terraform Example
In Terraform, you can define outputs to capture the Storage Account ID and endpoint like this:

```hcl
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name     = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier            = "Standard"
  account_replication_type = "LRS"
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "storage_account_endpoint" {
  value = "https://${azurerm_storage_account.example.name}.blob.core.windows.net/"
}
```

### Bicep Example
In Bicep, you can define outputs in a similar manner as follows:

```bicep
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name     : 'myuni