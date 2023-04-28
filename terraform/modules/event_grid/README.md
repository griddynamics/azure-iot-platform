<!-- BEGIN_TF_DOCS -->
# EventGrid module

Terraform module which creates EventGrid System topic and Event Subscription for
IoT Hub device telemtry and Azure Function

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.47.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_system_topic.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic) | resource |
| [azurerm_eventgrid_system_topic_event_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic_event_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_subscription_name"></a> [event\_subscription\_name](#input\_event\_subscription\_name) | The name which should be used for this Event Subscription. Changing this forces a new Event Subscription to be created. | `string` | n/a | yes |
| <a name="input_function_id"></a> [function\_id](#input\_function\_id) | Specifies the ID of the Function where the Event Subscription will receive events. This must be the functions ID in format {function\_app.id}/functions/{name}. | `string` | n/a | yes |
| <a name="input_iothub_id"></a> [iothub\_id](#input\_iothub\_id) | The ID of the IoT Hub which is used as ARM Source. Changing this forces a new Event Grid System Topic to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Event Grid System Topic should exist. Changing this forces a new Event Grid System Topic to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_system_topic_name"></a> [system\_topic\_name](#input\_system\_topic\_name) | The name which should be used for this Event Grid System Topic. Changing this forces a new Event Grid System Topic to be created. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
