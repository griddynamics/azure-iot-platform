output "functionapp_id" {
  description = "Returns ID of the Function App "
  value       = azurerm_function_app.this.id
}

output "function_id" {
  description = "Returns ID of the specific Function"
  value       = "${azurerm_function_app.this.id}/functions/iottotwins"
}
