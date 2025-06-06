output "primarykey" {
  value     = azurerm_storage_account.example_st.primary_access_key
  sensitive = true
}

# Вихідний параметр для основного хоста BLOB
output "host" {
  value = azurerm_storage_account.example_st.primary_blob_host
}
