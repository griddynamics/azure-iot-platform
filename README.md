# Analytical Data Platform: Internet of Things 

## Overview

The Supply Chain system contains the various components that work together to ensure an efficient flow of goods from suppliers to consumers. Therefore, the components are transportation methods, production and storage facilities, all of which contribute to the overall performance of the system. Each component has specific attributes, such as speed, temperature, humidity etc. A simulation script generates data for 151 units, that incudes the following system components:

- Air Shipment Devices (14 units) - Facilitate air freight for fast, long-distance cargo transportation.
- Boat Shipment Devices (10 units) - Handle sea transport for cost-effective, bulk cargo shipping.
- Conveyor Devices (20 units) - Automate and streamline the movement of goods within facilities.
- Cutter Devices (20 units) - Essential for shaping, trimming, and separating materials during production.
- Factory Devices (5 units) - Represent manufacturing facilities where raw materials become finished products.
- Shop Devices (20 units) - Retail outlets for selling goods to end consumers.
- Store Room Devices (20 units) - Enable temporary storage and organization of goods within facilities.
- Supplier Devices (8 units) - Vendors providing raw materials, components, or finished goods.
- Truck Shipment Devices (26 units) - Manage road freight for versatile and cost-effective transportation.
- Ware House Devices (8 units) - Large storage facilities that serve as distribution hubs within the supply chain.

## Deployment in Azure Cloud

### Requirements 

To install this product, we expect that you have got *azure-cli* and *terraform utilities installed and configured properly on the machine where terraform code will be executed.

As well, verify that environment variables

```bash
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_TENANT_ID
ARM_SUBSCRIPTION_ID
```
are set up with appropriate values and RSA SSH key under ~/.ssh/ is present.

### Role requirements

Deployment of this solution was test with 'Cloud Application Administrator' role which contains next permiissions:

| Role permissions |     |
| ---------------- | --- |
| microsoft.directory/adminConsentRequestPolicy/allProperties/allTasks | Manage admin consent request policies in Azure AD. |
microsoft.directory/appConsent/appConsentRequests/allProperties/read | Read all properties of consent requests for applications registered with Azure AD. |
| microsoft.directory/applications/create | Create all types of applications. |
| microsoft.directory/applications/delete | Delete all types of applications. |
| microsoft.directory/applications/appRoles/update | Update the appRoles property on all types of applications. |
| microsoft.directory/applications/audience/update | Update the audience property for applications. |
| microsoft.directory/applications/authentication/update | Update authentication on all types of applications. |
| microsoft.directory/applications/basic/update | Update basic properties for applications. |
| microsoft.directory/applications/credentials/update | Update application credentials. |
| microsoft.directory/applications/extensionProperties/update | Update extension properties on applications. |
| microsoft.directory/applications/notes/update | Update notes of applications. |
| microsoft.directory/applications/owners/update | Update owners of applications. |
| microsoft.directory/applications/permissions/update | Update exposed permissions and required permissions on all types of applications. |
| microsoft.directory/applications/policies/update | Update policies of applications. |
| microsoft.directory/applications/tag/update | Update tags of applications. |
| microsoft.directory/applications/verification/update | Update applicationsverification property. |
| microsoft.directory/applications/synchronization/standard/read | Read provisioning settings associated with the application object. |
| microsoft.directory/applicationTemplates/instantiate | Instantiate gallery applications from application templates. |
| microsoft.directory/auditLogs/allProperties/read | Read all properties on audit logs, including privileged properties. |
| microsoft.directory/deletedItems.applications/delete | Permanently delete applications, which can no longer be restored. |
| microsoft.directory/deletedItems.applications/restore | Restore soft deleted applications to original state. |
| microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks | Create and delete OAuth 2.0 permission grants, and read and update all properties. |
| microsoft.directory/applicationPolicies/create | Create application policies. |
| microsoft.directory/applicationPolicies/delete | Delete application policies. |
| microsoft.directory/applicationPolicies/standard/read | Read standard properties of application policies. |
| microsoft.directory/applicationPolicies/owners/read | Read owners on application policies. |
| microsoft.directory/applicationPolicies/policyAppliedTo/read | Read application policies applied to objects list. |
| microsoft.directory/applicationPolicies/basic/update | Update standard properties of application policies. |
| microsoft.directory/applicationPolicies/owners/update | Update the owner property of application policies. |
| microsoft.directory/provisioningLogs/allProperties/read | Read all properties of provisioning logs. |
| microsoft.directory/servicePrincipals/create | Create service principals. |
| microsoft.directory/servicePrincipals/delete | Delete service principals. |
| microsoft.directory/servicePrincipals/disable | Disable service principals. |
| microsoft.directory/servicePrincipals/enable | Enable service principals. |
| microsoft.directory/servicePrincipals/getPasswordSingleSignOnCredentials | Manage password single sign-on credentials on service principals. |
| microsoft.directory/servicePrincipals/synchronizationCredentials/manage | Manage application provisioning secrets and credentials. |
| microsoft.directory/servicePrincipals/synchronizationJobs/manage | Start, restart, and pause application provisioning syncronization jobs. |
| microsoft.directory/servicePrincipals/synchronizationSchema/manage | Create and manage application provisioning syncronization jobs and schema. |
| microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials | Read password single sign-on credentials on service principals. |
| microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-application-admin | Grant consent for application permissions and delegated permissions on behalf of any user or all users, except for application permissions for Microsoft Graph and Azure AD Graph. |
| microsoft.directory/servicePrincipals/audience/update | Update audience properties on service principals. |
| microsoft.directory/servicePrincipals/authentication/update | Update authentication properties on service principals. |
| microsoft.directory/servicePrincipals/basic/update | Update basic properties on service principals. |
| microsoft.directory/servicePrincipals/credentials/update | Update credentials of service principals. |
| microsoft.directory/servicePrincipals/notes/update | Update notes of service principals. |
| microsoft.directory/servicePrincipals/owners/update | Update owners of service principals. |
| microsoft.directory/servicePrincipals/permissions/update | Update permissions of service principals. |
| microsoft.directory/servicePrincipals/policies/update | Update policies of service principals. |
| microsoft.directory/servicePrincipals/tag/update | Update the tag property for service principals. |
| microsoft.directory/servicePrincipals/synchronization/standard/read | Read provisioning settings associated with your service principal. |
| microsoft.directory/signInReports/allProperties/read | Read all properties on sign-in reports, including privileged properties. |
| microsoft.azure.serviceHealth/allEntities/allTasks | Read and configure Azure Service Health. |
| microsoft.azure.supportTickets/allEntities/allTasks | Create and manage Azure support tickets. |
| microsoft.office365.serviceHealth/allEntities/allTasks | Read and configure Service Health in the Microsoft 365 admin center. |
| microsoft.office365.supportTickets/allEntities/allTasks | Create and manage Microsoft 365 service requests. |
| microsoft.office365.webPortal/allEntities/standard/read | Read basic properties on all resources in the Microsoft 365 admin center. |
| microsoft.directory/administrativeUnits/standard/read | Read basic properties on administrative units. |
| microsoft.directory/administrativeUnits/members/read | Read members of administrative units. |
| microsoft.directory/applications/standard/read | Read standard properties of applications. |
| microsoft.directory/applications/owners/read | Read owners of applications. |
| microsoft.directory/applications/policies/read | Read policies of applications. |
| microsoft.directory/contacts/standard/read | Read basic properties on contacts in Azure AD. |
| microsoft.directory/contacts/memberOf/read | Read the group membership for all contacts in Azure AD. |
| microsoft.directory/contracts/standard/read | Read basic properties on partner contracts. |
| microsoft.directory/devices/standard/read | Read basic properties on devices. |
| microsoft.directory/devices/memberOf/read | Read device memberships. |
| microsoft.directory/devices/registeredOwners/read | Read registered owners of devices. |
| microsoft.directory/devices/registeredUsers/read | Read registered users of devices. |
| microsoft.directory/directoryRoles/standard/read | Read basic properties of Azure AD roles. |
| microsoft.directory/directoryRoles/eligibleMembers/read | Read the eligible members of Azure AD roles. |
| microsoft.directory/directoryRoles/members/read | Read all members of Azure AD roles. |
| microsoft.directory/domains/standard/read | Read basic properties on domains. |
| microsoft.directory/groups/standard/read | Read standard properties of Security groups and Microsoft 365 groups, including role-assignable groups. |
| microsoft.directory/groups/appRoleAssignments/read | Read application role assignments of groups. |
| microsoft.directory/groups/memberOf/read | Read the memberOf property on Security groups and Microsoft 365 groups, including role-assignable groups. |
| microsoft.directory/groups/members/read | Read members of Security groups and Microsoft 365 groups, including role-assignable groups. |
| microsoft.directory/groups/owners/read | Read owners of Security groups and Microsoft 365 groups, including role-assignable groups. |
| microsoft.directory/groups/settings/read | Read settings of groups. |
| microsoft.directory/groupSettings/standard/read | Read basic properties on group settings. |
| microsoft.directory/groupSettingTemplates/standard/read | Read basic properties on group setting templates. |
| microsoft.directory/oAuth2PermissionGrants/standard/read | Read basic properties on OAuth 2.0 permission grants. |
| microsoft.directory/organization/standard/read | Read basic properties on an organization. |
| microsoft.directory/organization/trustedCAsForPasswordlessAuth/read | Read trusted certificate authorities for passwordless authentication. |
| microsoft.directory/applicationPolicies/standard/read | Read standard properties of application policies. |
| microsoft.directory/roleAssignments/standard/read | Read basic properties on role assignments. |
| microsoft.directory/roleDefinitions/standard/read | Read basic properties on role definitions. |
| microsoft.directory/servicePrincipals/appRoleAssignedTo/read | Read service principal role assignments. |
| microsoft.directory/servicePrincipals/appRoleAssignments/read | Read role assignments assigned to service principals. |
| microsoft.directory/servicePrincipals/standard/read | Read basic properties of service principals. |
| microsoft.directory/servicePrincipals/memberOf/read | Read the group memberships on service principals. |
| microsoft.directory/servicePrincipals/oAuth2PermissionGrants/read | Read delegated permission grants on service principals. |
| microsoft.directory/servicePrincipals/owners/read | Read owners of service principals. |
| microsoft.directory/servicePrincipals/ownedObjects/read | Read owned objects of service principals. |
| microsoft.directory/servicePrincipals/policies/read | Read policies of service principals. |
| microsoft.directory/subscribedSkus/standard/read | Read basic properties on subscriptions. |
| microsoft.directory/users/standard/read | Read basic properties on users. |
| microsoft.directory/users/appRoleAssignments/read | Read application role assignments for users. |
| microsoft.directory/users/deviceForResourceAccount/read | Read deviceForResourceAccount of users. |
| microsoft.directory/users/directReports/read | Read the direct reports for users. |
| microsoft.directory/users/licenseDetails/read | Read license details of users. |
| microsoft.directory/users/manager/read | Read manager of users. |
| microsoft.directory/users/memberOf/read | Read the group memberships of users. |
| microsoft.directory/users/oAuth2PermissionGrants/read | Read delegated permission grants on users. |
| microsoft.directory/users/ownedDevices/read | Read owned devices of users. |
| microsoft.directory/users/ownedObjects/read | Read owned objects of users. |
| microsoft.directory/users/photo/read | Read photo of users. |
| microsoft.directory/users/registeredDevices/read | Read registered devices of users. |
| microsoft.directory/users/scopedRoleMemberOf/read | Read user's membership of an Azure AD role, that is scoped to an administrative unit. |
| microsoft.directory/users/sponsors/read | |

### Basic usage

Under 'terraform/' directory you will find subdirectory iot/ with the module which represents the whole soltuon.

Use the following сommand listing for basic installation. You will be prompted for required variables.

**IMPORTANT!** Do not forget to set up environment variables properly.

```bash
terraform init
terraform apply
```

### Advanced options

As terraform code provides basic usage scenario, you might want to customise it.

If you would prefer to use remote backend for Azure provider, you can customize provider settings in terraform/solutions/iot/versions.tf

By default configuration is pretty simple:

```hcl
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
```

There is a possibility to update default tags for resources if it is required. For this, check terraform/solutions/iot/locals.tf and update with appropriate values for your case.

```hcl
locals {
  tags = {
    platform = var.platform
    solution = var.solution
    location = var.location
    owner    = var.owner
    source   = "terraform"
  }
}
```

For the resource naming, solution uses [Azure/naming/](https://registry.terraform.io/modules/Azure/naming/azurerm/latest) module. You can patch suffixes in terraform/solutions/iot/main.tf 

```hcl
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.2.0"
  suffix  = [var.platform, var.owner, var.solution]
}
```

If it does not comply with your internal policies, you can specify your own names instead of calls to naming module. For example, you can replace names for resource group and virtual network in terraform/solutions/iot/main.tf on any you would prefer.

```hcl
module "base" {
  source              = "../../components/base"
  resource_group_name = module.naming.resource_group.name # Can be anything you 
  location            = var.location
  vnet_name           = module.naming.virtual_network.name
  vnet_address_space  = var.vnet_cidr
  subnets             = var.subnets
  tags                = local.tags
}
```


## Big Picture

![Big Picture](images/azure_iot_platform.png)

### Digital Twins Models import

To import Digital Twins Model, open Digital Twins Explorer UI in Azure:  

- upload models: “models” folder (*.json)
- import Twin Graph: “models/FullTwins.xlsx”
- upload models images: “models/icons” folder (*.png)

For more information, check [Digital Twins Documentation](https://learn.microsoft.com/en-us/azure/digital-twins/quickstart-azure-digital-twins-explorer) 


# IoT Devices Simulator

A Python application simulates multiple IoT devices and sends periodic telemetry messages to [Azure IoT Hub](https://learn.microsoft.com/en-us/azure/iot-hub/) or [Azure IoT Edge Hub](https://learn.microsoft.com/en-us/azure/iot-edge/).
The application uses the [Azure IoT Hub Service SDK](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-sdks#azure-iot-hub-service-sdks) to create new IoT devices and [Azure IoT Device SDK](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-sdks#azure-iot-hub-device-sdks) to send messages.

## Installation

Install required packages:

```bash
pip install -r requirements.txt
```

Copy IoT Edge root CA certificate to `./certificates/azure-iot-test-only.root.ca.cert.pem`

For additional instructions regarding certificate generation and usage, refer to [Azure IoT docs](https://learn.microsoft.com/en-us/azure/iot-hub/tutorial-x509-openssl)


## Usage

```bash
python simulator.py [--config_path CONFIG_PATH]
```
Arguments:
* CONFIG_PATH - path to the config.json file. Default value: `config.json`

Configuration file (`config.json`)

```json
{
    "iot_hub_host_name": "<name>.azure-devices.net",
    "iot_hub_connection_string": "HostName=<HostName>;SharedAccessKeyName=<SharedAccessKeyName>;SharedAccessKey=<SharedAccessKey>",
    "devices_primary_key": "<primary key>",
    "devices_secondary_key": "<secondary key>",
    "edge_host_name": "<Name or IP>",
    "edge_device_scope": "ms-azure-iot-edge://<scope>",
    "edge_device_id": "<edge device id>",
    "edge_ca_cert_path": "./certificates/azure-iot-test-only.root.ca.cert.pem",
    "use_edge_hub": true,
    "minutes_to_run": 3.0
}
```

 specifies the following parameters:
* "iot_hub_host_name" (string): IoT Hub host name,
* "iot_hub_connection_string" (string): IoTHub connection string,
* "devices_primary_key" (string): Primary devices authentication key (one for all devices),
* "devices_secondary_key" (string): Secondary devices authentication key (one for all devices),
* "edge_host_name" (string): IoT Edge Hub host name,
* "edge_device_scope" (string): Edge device "device_scope" parameter,
* "edge_device_id" (string): Name (Id) of the edge device,
* "edge_ca_cert_path" (string): IoT Edge root CA certificate,
* "use_edge_hub" (bool): Uses IoT Edge Hub,
* "minutes_to_run" (float): Number of minutes for simulation to run.

### Example

```bash
python simulator.py
```

## Reference

* [Configure an IoT Edge device to act as a transparent gateway](https://learn.microsoft.com/en-us/azure/iot-edge/how-to-create-transparent-gateway?view=iotedge-1.4&tabs=iotedge)
* [Connect a downstream device to an Azure IoT Edge gateway](https://learn.microsoft.com/en-us/azure/iot-edge/how-to-connect-downstream-device?view=iotedge-1.4&tabs=ubuntu%2Cpython)

