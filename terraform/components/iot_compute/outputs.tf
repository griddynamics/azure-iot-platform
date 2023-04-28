output "storage_account_id" {
  value = azurerm_storage_account.iot.id
}

output "iothub_id" {
  value = module.iothub.iothub.id
}

output "function_id" {
  value = module.iottotwins.function_id
}
