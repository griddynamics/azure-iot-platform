/**
 * # Databricks Workspace module
 *
 * Terraform module which creates Databricks workspace
 *
 */

resource "azurerm_databricks_workspace" "this" {
  name                = var.databricks_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"
  tags                = var.tags
}
