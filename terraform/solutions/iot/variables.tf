variable "location" {
  type        = string
  description = "The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created."
}

variable "platform" {
  type        = string
  description = "Specifies platform's name abbreviation. Will be used for tagging and names"
  default     = "adp"
}

variable "solution" {
  type        = string
  description = "Specifies solution name. Will be used for tagging and names"
  default     = "iot"
}

variable "owner" {
  type        = string
  description = "Specifies owner of the current deployment. E.g. username or business unit. Will be used for tagging and names"
}

variable "source_cidr" {
  type        = string
  description = "CIDR to be allowed for external access to edge device. Specify '*' for all"
}

variable "admin_user_name" {
  type        = string
  description = "Specifies admin username to use with Edge device emulation."
  default     = "adpadmin"
}

variable "ssh_key_path" {
  type        = string
  description = "Filepath to the file which contains public SSH key to be used with Edge device simulation"
  default     = "~/.ssh/id_rsa.pub"
}

variable "vnet_cidr" {
  type        = string
  description = "Virtual Network CIDR"
  default     = "172.30.0.0/24"
}

variable "subnets" {
  type        = map(any)
  description = "Map of subnets with specified IP ranges"
  default = {
    default = {
      range : "172.30.0.0/24"
      delegations : {}
    }
  }
}
