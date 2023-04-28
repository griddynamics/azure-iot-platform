resource "azurerm_virtual_network_peering" "peering_from" {
  name                      = "${var.first_vnet_name}-to-${var.second_vnet_name}"
  resource_group_name       = var.first_vnet_resource_group_name
  virtual_network_name      = var.first_vnet_name
  remote_virtual_network_id = var.second_vnet_id

  allow_virtual_network_access = var.first_vnet_allow_virtual_network_access
  allow_forwarded_traffic      = var.first_vnet_allow_forwarded_traffic
  use_remote_gateways          = var.first_vnet_use_remote_gateways
  allow_gateway_transit        = var.first_vnet_allow_gateway_transit
}

resource "azurerm_virtual_network_peering" "peering_to" {
  name                      = "${var.second_vnet_name}-to-${var.first_vnet_name}"
  resource_group_name       = var.second_vnet_resource_group_name
  virtual_network_name      = var.second_vnet_name
  remote_virtual_network_id = var.first_vnet_id

  allow_virtual_network_access = var.second_vnet_allow_virtual_network_access
  allow_forwarded_traffic      = var.second_vnet_allow_forwarded_traffic
  use_remote_gateways          = var.second_vnet_use_remote_gateways
  allow_gateway_transit        = var.second_vnet_allow_gateway_transit
}
