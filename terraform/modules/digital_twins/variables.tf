variable "digital_twins_name" {
  type        = string
  description = "Specifies the name slug of the Digital Twins resource."
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
