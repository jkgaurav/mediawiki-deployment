terraform {
  backend "azurerm" {
    resource_group_name   = "tf-backend-rg"
    storage_account_name  = "mediawikideploymentsa01"
    container_name        = "tfstate"
    key                   = "mediawiki.tfstate"
  }
}

provider "azurerm" {
  features {}
}