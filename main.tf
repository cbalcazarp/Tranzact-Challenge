terraform {
  backend "azurerm" {
    resource_group_name  = "tranzact_RG"
    storage_account_name = "tranzactcbalcazar4585"
    container_name       = "tranzactcbalcazar4585container"
    key                  = "terraform.tfstate"
  }
}  

## added new test comment
## added new comment 2

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
  ip_rules = ["190.237.28.62","4.0.0.0/8","13.0.0.0/8","20.0.0.0/8","23.0.0.0/8","40.0.0.0/8","51.0.0.0/8","52.0.0.0/8","65.0.0.0/8","68.0.0.0/8","70.0.0.0/8","74.0.0.0/8","94.0.0.0/8","98.0.0.0/8","104.0.0.0/8","108.0.0.0/8","131.0.0.0/8","134.0.0.0/8","137.0.0.0/8","138.0.0.0/8","157.0.0.0/8","168.0.0.0/8","172.0.0.0/8","191.0.0.0/8","199.0.0.0/8","204.0.0.0/8","207.0.0.0/8","208.0.0.0/8","209.0.0.0/8","213.0.0.0/8"]
  bypass = "AzureServices"
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
  ip_rules = ["190.237.28.62","4.0.0.0/8","13.0.0.0/8","20.0.0.0/8","23.0.0.0/8","40.0.0.0/8","51.0.0.0/8","52.0.0.0/8","65.0.0.0/8","68.0.0.0/8","70.0.0.0/8","74.0.0.0/8","94.0.0.0/8","98.0.0.0/8","104.0.0.0/8","108.0.0.0/8","131.0.0.0/8","134.0.0.0/8","137.0.0.0/8","138.0.0.0/8","157.0.0.0/8","168.0.0.0/8","172.0.0.0/8","191.0.0.0/8","199.0.0.0/8","204.0.0.0/8","207.0.0.0/8","208.0.0.0/8","209.0.0.0/8","213.0.0.0/8"]
  virtual_network_subnet_ids = [module.networking_module.subnet_id]
  owner_name = module.networking_module.owner_name
}
