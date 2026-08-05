resource "azurerm_virtual_network" "myvnet" {
  name = "${var.rg_name}-vnet1"
  location = "${var.location}"
  resource_group_name = azurerm_resouce_group.
}