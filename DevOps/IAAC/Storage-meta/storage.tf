resource "azurerm_storage_account" "storage1" {
#   name                     = "${var.storage_account_name}${count.index}"
name = "${count.index + 1}${var.storage_account_name}"
  resource_group_name      = azurerm_resource_group.ayman-rg.name
  location                 = azurerm_resource_group.ayman-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  count                    = var.str_count
}

