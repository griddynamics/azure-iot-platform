<!-- BEGIN_TF_DOCS -->
# Edge component for IoT

Creates Azure Virtual machine and additional resources which represents Edge device

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
| <a name="module_edge_device"></a> [edge\_device](#module\_edge\_device) | ../../modules/virtual_machine | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user_name"></a> [admin\_user\_name](#input\_admin\_user\_name) | Specifies username for the admin user account | `string` | `"adpadmin"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | Specifies name of the Network Interface resource. | `string` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Specifies name of the Public IP resource. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Specifies name of the Security Group resource. | `string` | n/a | yes |
| <a name="input_source_cidr"></a> [source\_cidr](#input\_source\_cidr) | IP Address or CIDR which will be allowed to access VM | `string` | n/a | yes |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | Path to the id\_rsa.pub file which will be used for auth on the VM. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet which will be used for VM's NIC. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_virtual_machine_name"></a> [virtual\_machine\_name](#input\_virtual\_machine\_name) | Specifies name of the Virtual Machine resource. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
