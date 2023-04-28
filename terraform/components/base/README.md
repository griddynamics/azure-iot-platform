<!-- BEGIN_TF_DOCS -->
# Base component

Base component creates essential resources like resource group and vnet with subnets.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../../modules/third-party/network | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_dns_zone"></a> [create\_private\_dns\_zone](#input\_create\_private\_dns\_zone) | Bool variable to enable/disable private dns zone creation | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Name which should be used for the Resource Group. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map of subnets to create. | `map(any)` | <pre>{<br>  "snet-default": {<br>    "delegations": {},<br>    "range": "172.20.1.0/24"<br>  }<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the resources. | `map(string)` | `{}` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. | `string` | `"172.20.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The Name which should be used for the Virtual Network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_zone"></a> [private\_zone](#output\_private\_zone) | Object that represents private dns zone if it was created |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Object that represents created resource group. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Object that represents created subnets |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | Object that represents created virtual network |
<!-- END_TF_DOCS -->
