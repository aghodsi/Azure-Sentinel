param azureWebJobsStorage string
param watchlistName string = 'example-watchlist'
param azureSubscriptionId string = '00000000-0000-0000-0000-000000000000'
param resourceGroupName string = 'example-resource-group'
param workspaceName string = 'example-workspace'
param fileName string = 'example-file.csv'
param storageAccountName string = 'examplestorageaccount'
param storageContainerName string = 'example-container'
param watchlistProvider string = 'example-provider'
param watchlistSearchKey string = 'example-search-key'
param watchlistDescription string = 'example-description'

resource functionApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${watchlistName}-function'
  location: resourceGroup().location
  kind: 'functionapp'
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', '${watchlistName}-plan')
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'python'
        }
        {
          name: 'WATCHLIST_NAME'
          value: watchlistName
        }
        {
          name: 'AZURE_SUBSCRIPTION_ID'
          value: azureSubscriptionId
        }
        {
          name: 'RESOURCE_GROUP_NAME'
          value: resourceGroupName
        }
        {
          name: 'WORKSPACE_NAME'
          value: workspaceName
        }
        {
          name: 'FILE_NAME'
          value: fileName
        }
        {
          name: 'STORAGE_ACCOUNT_NAME'
          value: storageAccountName
        }
        {
          name: 'STORAGE_CONTAINER_NAME'
          value: storageContainerName
        }
        {
          name: 'WATCHLIST_PROVIDER'
          value: watchlistProvider
        }
        {
          name: 'WATCHLIST_SEARCH_KEY'
          value: watchlistSearchKey
        }
        {
          name: 'WATCHLIST_DESCRIPTION'
          value: watchlistDescription
        }
      ]
    }
  }
}
