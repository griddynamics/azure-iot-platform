<!-- BEGIN_TF_DOCS -->
# Data Layer component for IoT

Creates Digital Twins, Event Hub and Databricks resources that represents data layer

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.47.0, < 4.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_databricks"></a> [databricks](#module\_databricks) | ../../modules/databricks | n/a |
| <a name="module_digital_twin"></a> [digital\_twin](#module\_digital\_twin) | ../../modules/digital_twins | n/a |
| <a name="module_event_hub"></a> [event\_hub](#module\_event\_hub) | ../../modules/event_hub | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databricks_name"></a> [databricks\_name](#input\_databricks\_name) | Specifies name of the Databricks resource. | `string` | n/a | yes |
| <a name="input_digital_twins_name"></a> [digital\_twins\_name](#input\_digital\_twins\_name) | Specifies name of the Digital Twins resource. | `string` | n/a | yes |
| <a name="input_event_hub_name"></a> [event\_hub\_name](#input\_event\_hub\_name) | Specifies name of the Event Hub resource. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
