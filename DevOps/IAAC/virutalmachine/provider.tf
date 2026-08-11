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
  # client_id = "31626c5f-43ee-42ad-bce7-610b54e1ad36"
  # client_secret = ""
  # tenant_id = "1ee398d7-c819-4915-a6dc-29750dcc661f"
  # subscription_id = "f69fb365-d758-4000-8f93-1d76a718cfb6"
}