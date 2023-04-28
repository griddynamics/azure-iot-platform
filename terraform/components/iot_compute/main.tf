/**
* #  Compute component for IoT
*
* Compute component for IoT creates IoT Hub resource, Azure Function app and
* connects them via event grid resource.
*/

resource "azurerm_storage_account" "iot" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = var.tags
}

module "iothub" {
  source                               = "../../modules/iot_hub"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  iothub_name                          = var.iothub_name
  iothub_shared_access_policy_name     = var.iothub_shared_access_policy_name
  iothub_dps_name                      = var.iothub_dps_name
  iothub_dps_shared_access_policy_name = var.iothub_dps_shared_access_policy_name
  tags                                 = var.tags
}


module "app_insights" {
  source                              = "../../modules/application_insights"
  resource_group_name                 = var.resource_group_name
  location                            = var.location
  application_insights_workspace_name = var.app_insights_workspace_name
  app_insights = {
    "iottotwins" = {
      application_type = "web"
    }
  }
}

module "iottotwins" {
  source                                    = "../../modules/function_zip"
  resource_group_name                       = var.resource_group_name
  location                                  = var.location
  service_plan_name                         = var.service_plan_name
  function_app_name                         = var.function_app_name
  storage_account_name                      = azurerm_storage_account.iot.name
  storage_account_primary_connection_string = azurerm_storage_account.iot.primary_connection_string
  storage_account_access_key                = azurerm_storage_account.iot.primary_access_key
  tags                                      = var.tags
}

module "event_grid" {
  source                  = "../../modules/event_grid"
  resource_group_name     = var.resource_group_name
  location                = var.location
  system_topic_name       = var.event_grid_system_topic_name
  event_subscription_name = var.event_subscription_name
  iothub_id               = module.iothub.iothub.id
  function_id             = module.iottotwins.function_id
  #function_id = "/subscriptions/e8d0ecaf-de27-47d6-9cad-bb7f4c7566c2/resourceGroups/rg-adp-vsmnv-iot/providers/Microsoft.Web/sites/func-adp-vsmnv-iot-zau7/functions/iottotwins"
}
