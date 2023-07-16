module "networking_module" {
  source = "./networking"
  base_name = "tranzact"
  location = "East US"
  virtual_network_address_space = ["10.0.0.0/16"]
  address_prefixes = ["10.0.0.0/24"]
  owner_name = "cbalcazar"
}

module "storage_module" {
  source = "./storage"
  base_name = "tranzact"
  resource_group_name = module.networking_module.resource_group_name
  location = module.networking_module.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  container_access_type = "private"
  default_action = "Deny"
  ip_rules = ["190.237.28.62"]
  virtual_network_subnet_ids = [module.networking_module.subnet_id]
  owner_name = module.networking_module.owner_name
}

module "vault_module" {
  source = "./vault"
  base_name = "tranzact"
  resource_group_name = module.networking_module.resource_group_name
  location = module.networking_module.location
  enabled_for_disk_encryption = true
  soft_delete_retention_days = 7
  purge_protection_enabled = false
  sku_name = "standard"
  bypass = "AzureServices"
  default_action = "Deny"
  ip_rules = ["190.237.28.62"]
  virtual_network_subnet_ids = [module.networking_module.subnet_id]
  owner_name = module.networking_module.owner_name
}
