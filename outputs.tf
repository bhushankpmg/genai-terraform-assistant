In Azure Resource Manager (ARM) templates, you can define outputs for an Azure Storage Account that capture its ID and endpoint. Here’s how you can do this:

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
  },
  "parameters": {
    "storageAccountName": {
      "type": "string",
      "metadata": {
        "description": "The name of the Storage Account."
      }
    },
    "location": {
      "type": "string",
      "metadata": {
        "description": "The location of the Storage Account."
      }
    },
    "skuName": {
      "type": "string",
      "metadata": {
        "description": "The SKU name for the Storage Account."
      }
    },
    "skuTier": {
      "type": "string",
      "metadata": {
        "description": "The SKU tier for the Storage Account."
      }
    }
  }
}
```

### Explanation:
- **resources**: This section defines the storage account resource, including its type, location, SKU, and kind.
- **outputs**: This section defines the output values of the ARM template:
  - **storageAccountId**: This captures the ID of the storage account using the `resourceId` function.
  - **storageAccountEndpoint**: This constructs the endpoint for blob storage using the storage account name.
- **parameters**: This