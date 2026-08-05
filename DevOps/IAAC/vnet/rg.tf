resource "azurerm_resouce_group" "myrg" {
  name = "${var.rg_name}"
  location = "${var.location}"
}