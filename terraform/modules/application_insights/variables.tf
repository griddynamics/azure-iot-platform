variable "application_insights_workspace_name" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created."
}

variable "app_insights" {
  type        = map(any)
  description = "Specifies App Insights and their types to be created"
  default = {
    default = {
      application_type = "web"
    }
  }
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
