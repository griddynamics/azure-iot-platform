<!-- BEGIN_TF_DOCS -->
# IoT Solution

Creates resources that represents whole solution for the IoT

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.47.0, < 4.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base"></a> [base](#module\_base) | ../../components/base | n/a |
| <a name="module_data"></a> [data](#module\_data) | ../../components/iot_data_layer | n/a |
| <a name="module_iot_compute"></a> [iot\_compute](#module\_iot\_compute) | ../../components/iot_compute | n/a |
| <a name="module_iot_edge"></a> [iot\_edge](#module\_iot\_edge) | ../../components/iot_edge | n/a |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user_name"></a> [admin\_user\_name](#input\_admin\_user\_name) | Specifies admin username to use with Edge device emulation. | `string` | `"adpadmin"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the resources should exist. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Specifies owner of the current deployment. E.g. username or business unit. Will be used for tagging and names | `string` | n/a | yes |
| <a name="input_platform"></a> [platform](#input\_platform) | Specifies platform's name abbreviation. Will be used for tagging and names | `string` | `"adp"` | no |
| <a name="input_solution"></a> [solution](#input\_solution) | Specifies solution name. Will be used for tagging and names | `string` | `"iot"` | no |
| <a name="input_source_cidr"></a> [source\_cidr](#input\_source\_cidr) | CIDR to be allowed for external access to edge device. Specify '*' for all | `string` | n/a | yes |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | Filepath to the file which contains public SSH key to be used with Edge device simulation | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map of subnets with specified IP ranges | `map(any)` | <pre>{<br>  "default": {<br>    "delegations": {},<br>    "range": "172.30.0.0/24"<br>  }<br>}</pre> | no |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | Virtual Network CIDR | `string` | `"172.30.0.0/24"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
