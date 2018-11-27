variable "prefix" {
  default = "c9test"
}

resource "azurerm_resource_group" "rgone" {
  name     = "rgone"
  location = "West Europe"
}
resource "azurerm_resource_group" "rgtwo" {
  name     = "rgtwo"
  location = "West Europe"
}

resource "azurerm_virtual_network" "rgone" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rgone.location}"
  resource_group_name = "${azurerm_resource_group.rgone.name}"
}

resource "azurerm_subnet" "mgmt" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.rgone.name}"
  virtual_network_name = "${azurerm_virtual_network.rgone.name}"
  address_prefix       = "10.0.2.0/24"
}