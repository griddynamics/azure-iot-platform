/**
 * # EventGrid module
 *
 * Terraform module which creates EventGrid System topic and Event Subscription for
 * IoT Hub device telemtry and Azure Function
 */

resource "azurerm_eventgrid_system_topic" "this" {
  name                   = var.system_topic_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  source_arm_resource_id = var.iothub_id
  topic_type             = "Microsoft.Devices.IoTHubs"
}


resource "azurerm_eventgrid_system_topic_event_subscription" "this" {
  name                = var.event_subscription_name
  system_topic        = azurerm_eventgrid_system_topic.this.name
  resource_group_name = var.resource_group_name

  azure_function_endpoint {
    function_id                       = var.function_id
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }

  included_event_types = ["Microsoft.Devices.DeviceTelemetry"]
}
