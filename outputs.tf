In Azure, to define outputs for a Storage Account that capture its ID and endpoint, you typically use an Azure Resource Manager (ARM) template. The output section of the ARM template allows you to define values that can be returned after the deployment is completed.

Here’s how you can structure your ARM template to include outputs for the Storage Account ID and the primary endpoint:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2021-02-01",
      "name": "[parameters('storageAccountName')]",
      "location": "[parameters('location')]",
      "sku": {
        "name": "[parameters('skuName')]"
      },
      "kind": "[parameters('kind')]",
      "properties": {}
    }
  ],
  "parameters": {
    "storageAccountName": {
      "type": "string",
      "metadata": {
        "description": "Name of the storage account"
      }
    },
    "location": {
      "type": "string",
      "metadata": {
        "description": "Location for the storage account"
      }
    },
    "skuName": {
      "type": "string",
      "metadata": {
        "description": "SKU of the storage account"
      }
    },
    "kind": {
      "type": "string",
      "metadata": {
        "description": "Kind of storage account (e.g., StorageV2)"
      }
    }
  },
  "outputs": {
    "storageAccountId": {
      "type": "string",
      "value": "[resourceId('Microsoft.Storage/storageAccounts', parameters('storageAccountName'))]"
    },
    "primaryEndpoint": {
      "type": "string",
      "value": "[reference(resourceId('Microsoft.Storage/storageAccounts', parameters('storageAccountName'))).primaryEndpoints.blob]"
    }
  }
}
```

### Explanation of Outputs:
1. **storageAccountId**: This output uses the `resourceId` function to dynamically generate the resource ID of the storage account based on the name provided in the parameters.

2. **primaryEndpoint**: This output retrieves the primary blob service endpoint of the storage account by using the