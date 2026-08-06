locals {
  resource_group_name = "ayman-tf-rg2"
  resource_location = "eastus"
}


resource "azurerm_resource_group" "myrg1" {
  name = local.resource_group_name
  location = local.resource_location

  tags = { "Env" = "Training" }
}