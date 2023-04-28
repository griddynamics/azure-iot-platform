/**
 * # EventHub module
 *
 * Terraform module which creates IoT Hub and related resources.
 *
 */

resource "azurerm_eventhub_namespace" "this" {
  name                = var.eventhub_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 2
  tags                = var.tags
}

resource "azurerm_eventhub" "this" {
  for_each            = var.event_hubs
  name                = each.key
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.resource_group_name
  partition_count     = each.value.partition_count
  message_retention   = each.value.message_retention
}
