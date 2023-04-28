variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created."
}

variable "iothub_name" {
  type        = string
  description = "Specifies the name of the IotHub resource. Changing this forces a new resource to be created."
}

variable "iothub_shared_access_policy_name" {
  type        = string
  description = "Specifies the name of the IotHub Shared Access Policy resource."
}

variable "iothub_dps_name" {
  type        = string
  description = "Specifies the name of the Iot Device Provisioning Service resource."
}

variable "iothub_dps_shared_access_policy_name" {
  type        = string
  description = "Specifies the name of the IotHub Shared Access Policy."
}

variable "event_grid_system_topic_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "event_subscription_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "storage_account_name" {
  type        = string
  description = "Specifies the name of the storage account."

  validation {
    condition     = can(regex("^[[:alnum:]]+$", var.storage_account_name))
    error_message = "Only lowercase Alphanumeric characters allowed."
  }
}

variable "app_insights_workspace_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "service_plan_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "function_app_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
