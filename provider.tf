terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.64.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tranzact_RG"
    storage_account_name = "tranzactcbalcazar4585"
    container_name       = "tranzactcbalcazar4585container"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options  
  features {}
}