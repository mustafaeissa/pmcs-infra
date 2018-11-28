resource "azurerm_virtual_network" "mgmtvnet" {
  name                = "mgmtvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "northeurope"
  resource_group_name = "rgmgmt"
  dns_servers = ["10.0.1.10", "10.0.1.11", "168.63.129.16"]
}

resource "azurerm_resource_group" "rgmgmt" {
  name     = "rgmgmt"
  location = "northeurope"
}

resource "azurerm_subnet" "mgmtsbnt" {
  name                 = "mgmtsbnt"
  resource_group_name  = "rgmgmt"
  virtual_network_name = "mgmtvnet"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_resource_group" "rgtwo" {
  name     = "rgtwo"
  location = "northeurope"
}

resource "azurerm_subnet" "twosbnt" {
  name                 = "twosbnt"
  resource_group_name  = "rgtwo"
  virtual_network_name = "mgmtvnet"
  address_prefix       = "10.0.2.0/24"
}

