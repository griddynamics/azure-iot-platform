variable "public_ip_name" {
  type        = string
  description = "Specifies the name of the public IP resource."
}

variable "network_interface_name" {
  type        = string
  description = "Specifies the name of the network interface."
}

variable "virtual_machine_name" {
  type        = string
  description = "Specifies the name of the virtual machine"
}

variable "security_group_name" {
  type        = string
  description = "Specifies the name of the Security Group resource."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet which will be used for VM's NIC."
}

variable "source_cidr" {
  type        = string
  description = "IP Address or CIDR which will be allowed to access VM"
}


variable "admin_user_name" {
  type        = string
  description = "Specifies username for the admin user account"
  default     = "adpadmin"
}
variable "ssh_key_path" {
  type        = string
  description = "Path to the id_rsa.pub file which will be used for auth on the VM"
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
