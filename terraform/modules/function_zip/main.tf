/**
 * # Azure Functions module
 *
 * Terraform module which creates Azure Function App
 *
 */


resource "azurerm_service_plan" "this" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"
  tags                = var.tags
}

data "archive_file" "file_function_app" {
  type        = "zip"
  source_dir  = var.function_src_path
  output_path = "${var.function_app_name}.zip"
}

resource "azurerm_function_app" "this" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = azurerm_service_plan.this.id
  https_only          = true

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE                   = "1",
    FUNCTIONS_WORKER_RUNTIME                   = "python",
    AzureWebJobsDisableHomepage                = "true",
    WEBSITE_CONTENTOVERVNET                    = 1,
    ENABLE_ORYX_BUILD                          = false,
    "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING" = var.storage_account_primary_connection_string

  }

  os_type = "linux"

  site_config {
    linux_fx_version          = "python|3.9"
    use_32_bit_worker_process = false
  }

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = "~3"
}

locals {
  publish_code_command = "az webapp deployment source config-zip --resource-group ${var.resource_group_name} --name ${azurerm_function_app.this.name} --src ${data.archive_file.file_function_app.output_path}"
}

resource "null_resource" "app" {
  provisioner "local-exec" {
    command = local.publish_code_command
  }
  depends_on = [local.publish_code_command]
  triggers = {
    input_json           = filemd5(data.archive_file.file_function_app.output_path)
    publish_code_command = local.publish_code_command
  }
}
