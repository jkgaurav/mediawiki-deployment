### Resource Group
variable "resource_group_name" {
  description = "Name of RG"
  default = "mediawiki-rg"
}

variable "resource_group_location" {
  description = "Location of RG"
  default = "eastus"
}

### Storage Account
variable "storage_account_name" {
  description = "Name of SA"
  default = "mediawikideploymentsa01"
}

variable "storage_account_container_name" {
  description = "Name of Container in Storage Account"
  default = "tfstate"
}