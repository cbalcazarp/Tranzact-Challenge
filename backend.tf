terraform {
  backend "azurerm" {
    resource_group_name  = "tranzact_RG"
    storage_account_name = "tranzactcbalcazar4585"
    container_name       = "tranzactcbalcazar4585container"
    key                  = "terraform.tfstate"
  }
}