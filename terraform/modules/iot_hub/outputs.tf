output "iothub" {
  description = "Map which contains IoT Hub's ID and hostname."
  value = {
    id       = azurerm_iothub.this.id
    hostname = azurerm_iothub.this.hostname
  }
}
