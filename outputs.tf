In Azure, when you create a Storage Account using an Infrastructure as Code approach, such as with Azure Resource Manager (ARM) templates or Terraform, you can define outputs that capture the Storage Account ID and endpoint.

### ARM Template Example

If you are using an ARM template, you can define outputs at the end of your template like this:

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
        "name": "[parameters('skuName')]",
        "tier": "[parameters('skuTier')]"
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
      "value": "[concat('https://', parameters('storageAccountName'), '.blob.core.windows.net')]"
    }
  }
}
```

### Terraform Example

If you are using Terraform, you can define outputs as follows:

```hcl
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_tier
  account_replication_type = var.replication_type
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "storage_account_endpoint" {
  value = "https://${azurerm_storage_account.example.name}.blob.core.windows.net"
}
```

### Explanation

- **Storage Account ID**: This identifies the Storage Account uniquely in Azure. It can be used to reference the resource in other templates or scripts.
- **Storage Account Endpoint**: This is the URL endpoint that you use to access the Blob service of the Storage Account.

By leveraging outputs in your infrastructure code