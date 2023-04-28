variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created."
}

variable "service_plan_name" {
  type        = string
  description = "Specifies the name of the Service Plan resource."
}

variable "function_app_name" {
  type        = string
  description = "Specifies the name of the Function App resource."
}

variable "function_src_path" {
  type        = string
  description = "File path to the source code of specific Function"
  default     = "../../functions/iottotwins"
}

variable "storage_account_name" {
  type        = string
  description = "Specifies the name of the Storage Account resource."
}

variable "storage_account_access_key" {
  type        = string
  description = "Specifies Storage Account access key"
}

variable "storage_account_primary_connection_string" {
  type        = string
  description = "Specifies Storage Account primary connection string"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
