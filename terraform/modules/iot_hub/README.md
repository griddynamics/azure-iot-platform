<!-- BEGIN_TF_DOCS -->
# IoT Hub module

Terraform module which creates IoT Hub and related resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.47.0, < 4.0.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.1 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.49.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.9.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_iothub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub) | resource |
| [azurerm_iothub_dps.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_dps) | resource |
| [azurerm_iothub_dps_shared_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_dps_shared_access_policy) | resource |
| [azurerm_iothub_shared_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_shared_access_policy) | resource |
| [null_resource.iot-edge](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |
| [time_sleep.wait_100_seconds](https://registry.terraform.io/providers/hashicorp/time/0.9.1/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iothub_dps_name"></a> [iothub\_dps\_name](#input\_iothub\_dps\_name) | Specifies the name of the Iot Device Provisioning Service resource. | `string` | n/a | yes |
| <a name="input_iothub_dps_shared_access_policy_name"></a> [iothub\_dps\_shared\_access\_policy\_name](#input\_iothub\_dps\_shared\_access\_policy\_name) | Specifies the name of the IotHub Shared Access Policy. | `string` | n/a | yes |
| <a name="input_iothub_name"></a> [iothub\_name](#input\_iothub\_name) | Specifies the name of the IotHub resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_iothub_shared_access_policy_name"></a> [iothub\_shared\_access\_policy\_name](#input\_iothub\_shared\_access\_policy\_name) | Specifies the name of the IotHub Shared Access Policy resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iothub"></a> [iothub](#output\_iothub) | Map which contains IoT Hub's ID and hostname. |
<!-- END_TF_DOCS -->
