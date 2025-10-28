To define outputs for an Azure Storage Account that capture its ID and endpoint, you will typically include these in an Azure Resource Manager (ARM) template. Outputs in an ARM template allow you to return values once the deployment is complete.

Here’s a sample ARM template snippet that defines the outputs you are looking for:

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
        "name": "[parameters('storageAccountSku')]",
        "tier": "[parameters('storageAccountTier')]"
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
      "type": "string"
    },
    "location": {
      "type": "string"
    },
    "storageAccountSku": {
      "type": "string",
      "defaultValue": "Standard_LRS"
    },
    "storageAccountTier": {
      "type": "string",
      "defaultValue": "Standard"
    }
  }
}
```

### Explanation:

- **Storage Account Resource**: The `"resources"` section creates a Storage Account resource with parameters.
- **Outputs Section**: 
  - **`storageAccountId`**: This captures the unique resource ID of the storage account using the `resourceId` function, which constructs the ID based on the resource type and name.
  - **`storageAccountEndpoint`**: This constructs the Blob service endpoint URL using string concatenation. The endpoint generally takes the form of `https://<storageAccountName>.blob.core.windows.net`.
  
### Parameters Section:
- The `"parameters