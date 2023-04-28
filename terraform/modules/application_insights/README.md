<!-- BEGIN_TF_DOCS -->
# Application Insight module

Terraform module which creates Log Analytics workspace and app insights

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
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_insights"></a> [app\_insights](#input\_app\_insights) | Specifies App Insights and their types to be created | `map(any)` | <pre>{<br>  "default": {<br>    "application_type": "web"<br>  }<br>}</pre> | no |
| <a name="input_application_insights_workspace_name"></a> [application\_insights\_workspace\_name](#input\_application\_insights\_workspace\_name) | Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group under which the resource has to be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_insights"></a> [insights](#output\_insights) | Application insights data collection |
| <a name="output_workspace"></a> [workspace](#output\_workspace) | Log Analytics Workspace data |
<!-- END_TF_DOCS -->
