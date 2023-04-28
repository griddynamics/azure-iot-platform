/**
 * # Application Insight module
 *
 * Terraform module which creates Log Analytics workspace and app insights
 *
 */

resource "azurerm_log_analytics_workspace" "this" {
  name                = var.application_insights_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "this" {
  for_each            = var.app_insights
  name                = "appins-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.this.id
  application_type    = each.value.application_type
  tags                = var.tags
}
