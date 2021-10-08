output "id" {
  description = "Id of the storage account created."
  value       = azurerm_storage_account.sa.id
}

output "name" {
  description = "Name of the storage account created."
  value       = azurerm_storage_account.sa.name
}


output "blob_url" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.sa.primary_blob_endpointname
}