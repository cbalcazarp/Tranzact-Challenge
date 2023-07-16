terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

#resource "random_string" "tr_random" {
#  length = 6
#  special = false
#  upper = false
#}

resource "azurerm_storage_account" "tr_stac" {
  #name = "${var.base_name}${random_string.tr_random.result}"
  name = "${var.base_name}cbalcazar4585"
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type

  network_rules {
    bypass                     = [var.bypass]
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  tags = {
    owner = var.owner_name
  }
}

resource "azurerm_storage_container" "tr_cont" {
  name                  = "${azurerm_storage_account.tr_stac.name}container"
  storage_account_name  = azurerm_storage_account.tr_stac.name
  container_access_type = var.container_access_type
}