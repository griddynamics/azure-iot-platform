resource "azurerm_virtual_network" "main" {
  location            = var.location
  resource_group_name = var.resource_group_name

  name          = var.virtual_network_name
  address_space = [var.address_space]
}

resource "azurerm_subnet" "main" {
  for_each = var.subnets

  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name

  name             = each.key
  address_prefixes = [each.value.range]

  enforce_private_link_endpoint_network_policies = each.value.delegations != {} ? false : true
  dynamic "delegation" {
    for_each = each.value.delegations
    content {
      name = delegation.key
      service_delegation {
        name    = delegation.key
        actions = delegation.value
      }
    }
  }
}

resource "azurerm_private_dns_zone" "main" {
  count = var.create_private_dns_zone ? 1 : 0

  resource_group_name = var.resource_group_name

  name = var.private_dns_zone_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  count = var.private_dns_zone_name != "" ? 1 : 0

  name                  = "${var.private_dns_zone_name}-local"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = azurerm_virtual_network.main.id

  depends_on = [
    azurerm_private_dns_zone.main,
    azurerm_virtual_network.main
  ]
}
