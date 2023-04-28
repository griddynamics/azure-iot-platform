variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created."
}

variable "digital_twins_name" {
  type        = string
  description = "Specifies name of the Digital Twins resource."
}

variable "event_hub_name" {
  type        = string
  description = "Specifies name of the Event Hub resource."
}

variable "databricks_name" {
  type        = string
  description = "Specifies name of the Databricks resource."
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
