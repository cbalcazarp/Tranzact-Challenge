resource "azurerm_resource_group" "tr_rg" {
  name      = "${var.base_name}_RG"
  location  = var.location
  
  tags = {
    owner = var.owner_name
  }
}

resource "azurerm_virtual_network" "tr_network" {
  name                  = "${var.base_name}_VNET"
  location              = var.location
  resource_group_name   = azurerm_resource_group.tr_rg.name
  address_space         = var.virtual_network_address_space
  depends_on            = [ azurerm_resource_group.tr_rg ]

  tags = {
    owner = var.owner_name
  }
}

resource "azurerm_subnet" "tr_subnet_A" {
  name                  = "${var.base_name}_SUBNET"
  resource_group_name   = azurerm_resource_group.tr_rg.name
  virtual_network_name  = azurerm_virtual_network.tr_network.name
  address_prefixes      = var.address_prefixes
  service_endpoints     = [ "Microsoft.Storage", "Microsoft.KeyVault" ]
  depends_on            = [ azurerm_virtual_network.tr_network ]
}

resource "azurerm_network_security_group" "tr_nsg" {
  name                  = "${var.base_name}_NSG"
  location              = var.location
  resource_group_name   = azurerm_resource_group.tr_rg.name
  depends_on            = [ azurerm_virtual_network.tr_network ]

  tags = {
    owner = var.owner_name
  }

}

resource "azurerm_subnet_network_security_group_association" "tr_nsg_assoc" {
  subnet_id = azurerm_subnet.tr_subnet_A.id
  network_security_group_id = azurerm_network_security_group.tr_nsg.id

  depends_on = [ 
    azurerm_virtual_network.tr_network,
    azurerm_network_security_group.tr_nsg
  ]
}