# Required
variable "location" {
  type        = string
  description = "Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "subnets" {
  type        = map(any)
  description = ""
}

variable "address_space" {
  type        = string
  description = ""
}

variable "virtual_network_name" {
  type        = string
  description = ""
}

# Optional
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Any tags that should be present on the Azure resources"
}

variable "private_dns_zone_name" {
  type        = string
  default     = ""
  description = ""
  nullable    = false
}

variable "create_private_dns_zone" {
  type     = bool
  default  = false
  nullable = false
}

variable "core_network_id" {
  type     = string
  default  = ""
  nullable = false
}

variable "core_network_name" {
  type     = string
  default  = ""
  nullable = false
}

variable "core_resource_group_name" {
  type     = string
  default  = ""
  nullable = false
}
