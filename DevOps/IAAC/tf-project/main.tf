terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  
}

module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = "rg-demo-tf1"
  location            = "Central India"
}