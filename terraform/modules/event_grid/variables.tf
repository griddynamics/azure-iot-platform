variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Event Grid System Topic should exist. Changing this forces a new Event Grid System Topic to be created."
}

variable "iothub_id" {
  type        = string
  description = "The ID of the IoT Hub which is used as ARM Source. Changing this forces a new Event Grid System Topic to be created."
}

variable "function_id" {
  type        = string
  description = "Specifies the ID of the Function where the Event Subscription will receive events. This must be the functions ID in format {function_app.id}/functions/{name}."
}

variable "system_topic_name" {
  type        = string
  description = "The name which should be used for this Event Grid System Topic. Changing this forces a new Event Grid System Topic to be created."
}

variable "event_subscription_name" {
  type        = string
  description = "The name which should be used for this Event Subscription. Changing this forces a new Event Subscription to be created."
}
