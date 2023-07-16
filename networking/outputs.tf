output "resource_group_name" {
  value = azurerm_resource_group.tr_rg.name
}

output "location" {
  value = azurerm_virtual_network.tr_network.location
}

output "subnet_id" {
  value = azurerm_subnet.tr_subnet_A.id
}

output "owner_name" {
  value = lookup(azurerm_resource_group.tr_rg.tags, "owner")
}