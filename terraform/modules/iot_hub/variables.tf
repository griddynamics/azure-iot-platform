variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created."
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

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
