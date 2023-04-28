variable "eventhub_namespace_name" {
  type        = string
  description = "Specifies the name of the EventHub namespace resource. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}

variable "event_hubs" {
  type        = map(any)
  description = "Specifies Event Hubs and their parameters which will be created in the EventHub Namespace."
  default = {
    default = {
      partition_count   = 4
      message_retention = 7
    }
  }
}
