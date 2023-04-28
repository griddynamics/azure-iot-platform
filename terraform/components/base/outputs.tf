output "private_zone" {
  description = "Object that represents private dns zone if it was created"
  value       = module.vnet.private_zone
}

output "resource_group" {
  description = "Object that represents created resource group."
  value       = azurerm_resource_group.rg
}

output "subnets" {
  description = "Object that represents created subnets"
  value       = module.vnet.subnets
}

output "vnet" {
  description = "Object that represents created virtual network"
  value       = module.vnet.network
}
