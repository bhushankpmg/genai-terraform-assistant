In Azure, when you create a Storage Account using an Azure Resource Manager (ARM) template, you can specify outputs to capture important attributes of the resource, such as its ID and endpoint. Below is an example of how to define outputs for an Azure Storage Account that captures its ID and endpoint.

Assuming you already have a Storage Account resource defined in your ARM template, you can add the following outputs section to your template:

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
    "primaryEndpoint": {
      "type": "string",
      "value": "[reference(resourceId('Microsoft.Storage/storageAccounts', parameters('storageAccountName'))).primaryEndpoints.blob]"
    },
    "secondaryEndpoint": {
      "type": "string",
      "value": "[reference(resourceId('Microsoft.Storage/storageAccounts', parameters('storageAccountName'))).primaryEndpoints.queue]"
    }
  } 
}
```

### Explanation:

1. **Outputs Section**: The `outputs` section holds the values you want to expose after the deployment of the ARM template.

2. **Storage Account ID**:
   - The output named `storageAccountId` captures the ID of the Storage Account using the `resourceId` function which constructs the full resource ID of the specified storage account.

3. **Primary Endpoint**:
   - The output named `primaryEndpoint` retrieves the primary blob endpoint of the Storage Account using the `reference` function, which returns the resource model for the specified resource. We access the `primaryEndpoints.blob` property to get the blob service endpoint.

4. **Secondary Endpoint**:
   - The output named `secondaryEndpoint` this can vary based on the service type