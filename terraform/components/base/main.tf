/**
* # Base component
*
* Base component creates essential resources like resource group and vnet with subnets.
*/

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source = "../../modules/third-party/network"

  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  virtual_network_name    = var.vnet_name
  address_space           = var.vnet_address_space
  create_private_dns_zone = var.create_private_dns_zone
  subnets                 = var.subnets
}
