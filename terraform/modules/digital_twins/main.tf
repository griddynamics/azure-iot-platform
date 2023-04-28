/**
 * # Digital Twins module
 *
 * Terraform module which creates Digital Twins
 *
 */

resource "azurerm_digital_twins_instance" "this" {
  name                = var.digital_twins_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}
