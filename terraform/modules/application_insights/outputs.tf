output "workspace" {
  description = "Log Analytics Workspace data"
  value       = azurerm_log_analytics_workspace.this
}

output "insights" {
  description = "Application insights data collection"
  value       = azurerm_application_insights.this
}
