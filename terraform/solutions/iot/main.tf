/**
* # IoT Solution
*
* Creates resources that represents whole solution for the IoT
*/


module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.2.0"
  suffix  = [var.platform, var.owner, "platform"]
}

module "base" {
  source              = "../../components/base"
  resource_group_name = module.naming.resource_group.name
  location            = var.location
  vnet_name           = module.naming.virtual_network.name
  vnet_address_space  = var.vnet_cidr
  subnets             = var.subnets
  tags                = local.tags
}

module "iot_compute" {
  source                               = "../../components/iot_compute"
  resource_group_name                  = module.base.resource_group.name
  location                             = module.base.resource_group.location
  event_grid_system_topic_name         = module.naming.eventgrid_topic.name
  event_subscription_name              = module.naming.eventgrid_event_subscription.name
  iothub_name                          = module.naming.iothub.name
  iothub_shared_access_policy_name     = "iothubsap-adp-iot"
  iothub_dps_name                      = module.naming.iothub_dps.name
  iothub_dps_shared_access_policy_name = "iothubdpssap-adp-iot"
  storage_account_name                 = module.naming.storage_account.name
  function_app_name                    = module.naming.function_app.name
  service_plan_name                    = module.naming.app_service_plan.name
  app_insights_workspace_name          = module.naming.application_insights.name
  tags                                 = local.tags
}

locals {
  subnet = lookup(module.base.subnets, "default", "")
}

module "iot_edge" {
  source                 = "../../components/iot_edge"
  public_ip_name         = module.naming.public_ip.name_unique
  network_interface_name = module.naming.network_interface.name_unique
  virtual_machine_name   = module.naming.virtual_machine.name_unique
  security_group_name    = module.naming.network_security_group.name
  resource_group_name    = module.base.resource_group.name
  location               = module.base.resource_group.location
  subnet_id              = local.subnet.id
  source_cidr            = var.source_cidr
  admin_user_name        = var.admin_user_name
  ssh_key_path           = var.ssh_key_path
  tags                   = local.tags

}

module "data" {
  source              = "../../components/iot_data_layer"
  resource_group_name = module.base.resource_group.name
  location            = module.base.resource_group.location
  digital_twins_name  = "dt-adp-iot"
  event_hub_name      = module.naming.eventhub_namespace.name
  databricks_name     = module.naming.databricks_workspace.name
  tags                = local.tags
}
