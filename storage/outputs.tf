output "storage_account_name" {
  value = azurerm_storage_account.tr_stac.name
}

output "storage_container_name" {
  value = azurerm_storage_container.tr_cont.name
}