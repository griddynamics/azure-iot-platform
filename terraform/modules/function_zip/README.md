<!-- BEGIN_TF_DOCS -->
# Azure Functions module

Terraform module which creates Azure Function App

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.47.0, < 4.0.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.3.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.51.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app) | resource |
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [null_resource.app](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |
| [archive_file.file_function_app](https://registry.terraform.io/providers/hashicorp/archive/2.3.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | Specifies the name of the Function App resource. | `string` | n/a | yes |
| <a name="input_function_src_path"></a> [function\_src\_path](#input\_function\_src\_path) | File path to the source code of specific Function | `string` | `"../../functions/iottotwins"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_service_plan_name"></a> [service\_plan\_name](#input\_service\_plan\_name) | Specifies the name of the Service Plan resource. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | Specifies Storage Account access key | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Specifies the name of the Storage Account resource. | `string` | n/a | yes |
| <a name="input_storage_account_primary_connection_string"></a> [storage\_account\_primary\_connection\_string](#input\_storage\_account\_primary\_connection\_string) | Specifies Storage Account primary connection string | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_id"></a> [function\_id](#output\_function\_id) | Returns ID of the specific Function |
| <a name="output_functionapp_id"></a> [functionapp\_id](#output\_functionapp\_id) | Returns ID of the Function App |
<!-- END_TF_DOCS -->
