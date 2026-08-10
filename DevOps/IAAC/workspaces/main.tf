resource "azurerm_resource_group" "rg" {
  name     = "rg-${terraform.workspace}"
  location = "Canada Central"
}