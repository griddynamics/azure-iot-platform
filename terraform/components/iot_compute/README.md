<!-- BEGIN_TF_DOCS -->
#  Compute component for IoT

Compute component for IoT creates IoT Hub resource, Azure Function app and
connects them via event grid resource.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.47.0, < 4.0.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_insights"></a> [app\_insights](#module\_app\_insights) | ../../modules/application_insights | n/a |
| <a name="module_event_grid"></a> [event\_grid](#module\_event\_grid) | ../../modules/event_grid | n/a |
| <a name="module_iothub"></a> [iothub](#module\_iothub) | ../../modules/iot_hub | n/a |
| <a name="module_iottotwins"></a> [iottotwins](#module\_iottotwins) | ../../modules/function_zip | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.iot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_insights_workspace_name"></a> [app\_insights\_workspace\_name](#input\_app\_insights\_workspace\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_event_grid_system_topic_name"></a> [event\_grid\_system\_topic\_name](#input\_event\_grid\_system\_topic\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_event_subscription_name"></a> [event\_subscription\_name](#input\_event\_subscription\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_iothub_dps_name"></a> [iothub\_dps\_name](#input\_iothub\_dps\_name) | Specifies the name of the Iot Device Provisioning Service resource. | `string` | n/a | yes |
| <a name="input_iothub_dps_shared_access_policy_name"></a> [iothub\_dps\_shared\_access\_policy\_name](#input\_iothub\_dps\_shared\_access\_policy\_name) | Specifies the name of the IotHub Shared Access Policy. | `string` | n/a | yes |
| <a name="input_iothub_name"></a> [iothub\_name](#input\_iothub\_name) | Specifies the name of the IotHub resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_iothub_shared_access_policy_name"></a> [iothub\_shared\_access\_policy\_name](#input\_iothub\_shared\_access\_policy\_name) | Specifies the name of the IotHub Shared Access Policy resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_service_plan_name"></a> [service\_plan\_name](#input\_service\_plan\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Specifies the name of the storage account. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_id"></a> [function\_id](#output\_function\_id) | n/a |
| <a name="output_iothub_id"></a> [iothub\_id](#output\_iothub\_id) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
<!-- END_TF_DOCS -->
