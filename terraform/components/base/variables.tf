variable "resource_group_name" {
  type        = string
  description = "The Name which should be used for the Resource Group. Changing this forces a new Resource Group to be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created."
}

variable "vnet_name" {
  type        = string
  description = "The Name which should be used for the Virtual Network."
}

variable "vnet_address_space" {
  type        = string
  description = "The address space that is used the virtual network."
  default     = "172.20.0.0/16"
}

variable "subnets" {
  type        = map(any)
  description = "Map of subnets to create."
  default = {
    snet-default = {
      range : "172.20.1.0/24"
      delegations : {}
    }
  }
}

variable "create_private_dns_zone" {
  type        = bool
  description = "Bool variable to enable/disable private dns zone creation "
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the resources."
  default     = {}
}
