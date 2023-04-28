/**
* # Data Layer component for IoT
*
* Creates Digital Twins, Event Hub and Databricks resources that represents data layer
*/



module "digital_twin" {
  source              = "../../modules/digital_twins"
  digital_twins_name  = var.digital_twins_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

## Event Hub

module "event_hub" {
  source                  = "../../modules/event_hub"
  eventhub_namespace_name = var.event_hub_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  event_hubs = {
    "dt-telemetry" = {
      partition_count   = 4
      message_retention = 7
    }
  }

  tags = var.tags

}

module "databricks" {
  source                    = "../../modules/databricks"
  databricks_workspace_name = var.databricks_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  tags                      = var.tags
}
