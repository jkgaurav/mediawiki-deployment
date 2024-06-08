terraform {
  backend "azurerm" {
    resource_group_name   = var.resource_group_name
    storage_account_name  = "yourstorageaccount"
    container_name        = "tfstate"
    key                   = "mediawiki.tfstate"
  }
}

provider "azurerm" {
  features {}
}