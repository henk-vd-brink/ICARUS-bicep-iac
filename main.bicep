@allowed([
  'Standard_LRS'
])

param storageSKU string = 'Standard_LRS'
param location string = resourceGroup().location

resource stg 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'sticarusdev'
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

output storageEndpoint object = stg.properties.primaryEndpoints
