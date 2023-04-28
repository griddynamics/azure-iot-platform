/**
 * # IoT Hub module
 *
 * Terraform module which creates IoT Hub and related resources.
 *
 */

resource "azurerm_iothub" "this" {
  name                = var.iothub_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "S1"
    capacity = 1
  }

  cloud_to_device {
    max_delivery_count = 30
    default_ttl        = "PT1H"
    feedback {
      time_to_live       = "PT1H"
      max_delivery_count = 10
      lock_duration      = "PT1M"
    }
  }

  tags = var.tags
}

resource "azurerm_iothub_shared_access_policy" "this" {
  name                = var.iothub_shared_access_policy_name
  resource_group_name = var.resource_group_name
  iothub_name         = azurerm_iothub.this.name

  registry_read   = true
  registry_write  = true
  service_connect = true
}


resource "azurerm_iothub_dps" "this" {
  name                = var.iothub_dps_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "S1"
    capacity = 1
  }

  linked_hub {
    connection_string       = azurerm_iothub_shared_access_policy.this.primary_connection_string
    location                = var.location
    apply_allocation_policy = true
  }

  tags = var.tags
}

resource "azurerm_iothub_dps_shared_access_policy" "this" {
  name                = var.iothub_dps_shared_access_policy_name
  resource_group_name = var.resource_group_name
  iothub_dps_name     = azurerm_iothub_dps.this.name
  enrollment_write    = true
  enrollment_read     = true
  registration_read   = true
  registration_write  = true
  service_config      = true
}


locals {
  publish_code_command = "az iot hub device-identity create --device-id edge-device --hub-name ${var.iothub_name} --edge-enabled"
}

resource "time_sleep" "wait_100_seconds" {
  depends_on = [azurerm_iothub.this]

  create_duration = "100s"
}


resource "null_resource" "iot-edge" {
  provisioner "local-exec" {
    command = local.publish_code_command
  }
  depends_on = [time_sleep.wait_100_seconds]
  triggers = {
    iothub_id = azurerm_iothub.this.id
  }
}
