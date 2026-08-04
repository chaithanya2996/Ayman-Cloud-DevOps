# Create a resource group
resource "azurerm_resource_group" "myrg1" {
 name     = var.resource_group_name
  location = var.location
}

# # Create a resource group
# resource "azurerm_resource_group" "myrg2" {
#   name     = "ayman-rg2"
#   location = "centralindia"
# }

# # Create a resource group
# resource "azurerm_resource_group" "myrg3" {
#   name     = "ayman-rg3"
#   location = "eastus"
# }

# # Create a resource group
# resource "azurerm_resource_group" "myrg4" {
#   name     = "ayman-rg4"
#   location = "westeurope"
# }

# # Create a resource group
# resource "azurerm_resource_group" "myrg5" {
#   name     = "ayman-rg5"
#   location = "centralindia"
# }

# # Create a resource group
# resource "azurerm_resource_group" "myrg6" {
#   name     = "ayman-rg6"
#   location = "eastus"
# }