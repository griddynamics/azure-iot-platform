variable "first_vnet_name" {
  type = string
}

variable "second_vnet_name" {
  type = string
}

variable "first_vnet_id" {
  type = string
}

variable "second_vnet_id" {
  type = string
}

variable "first_vnet_resource_group_name" {
  type = string
}

variable "second_vnet_resource_group_name" {
  type = string
}

variable "first_vnet_allow_virtual_network_access" {
  type    = bool
  default = true
}

variable "first_vnet_allow_forwarded_traffic" {
  type    = bool
  default = true
}

variable "first_vnet_use_remote_gateways" {
  type    = bool
  default = false
}

variable "first_vnet_allow_gateway_transit" {
  type    = bool
  default = false
}

variable "second_vnet_allow_virtual_network_access" {
  type    = bool
  default = true
}

variable "second_vnet_allow_forwarded_traffic" {
  type    = bool
  default = true
}

variable "second_vnet_use_remote_gateways" {
  type    = bool
  default = false
}

variable "second_vnet_allow_gateway_transit" {
  type    = bool
  default = false
}
