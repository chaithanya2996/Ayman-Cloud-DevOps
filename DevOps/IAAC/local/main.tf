terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "TF-REMOTE_RG"
    storage_account_name = "aymantfremotebackend1"
    container_name = "aymancontainer"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

}