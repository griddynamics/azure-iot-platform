output "subnets" {
  value = azurerm_subnet.main
}

output "private_zone" {
  value = try(azurerm_private_dns_zone.main[0], null)
}

output "network" {
  value = azurerm_virtual_network.main
}
