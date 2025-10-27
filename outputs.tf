In Azure, when you create a storage account using an Azure Resource Manager (ARM) template, you can define outputs to capture specific properties of the resources you have created. To capture the storage account's ID and endpoint, you can define outputs in the ARM template as follows:

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
        "description": "Name of the Storage Account"
      }
    },
    "location": {
      "type": "string",
      "metadata": {
        "description": "Location for the Storage Account"
      }
    },
    "skuName": {
      "type": "string",
      "metadata": {
        "description": "SKU name for the Storage Account"
      }
    },
    "skuTier": {
      "type": "string",
      "metadata": {
        "description": "SKU tier for the Storage Account"
      }
    }
  }
}
```

### Explanation:
- **Outputs Section**: This section defines two outputs:
  - `storageAccountId`: This output captures the ID of the storage account resource. The `resourceId` function is used to construct the full resource ID based on the resource type and the parameters provided.
  - `storageAccountEndpoint`: This output constructs the blob endpoint URL for the storage account using