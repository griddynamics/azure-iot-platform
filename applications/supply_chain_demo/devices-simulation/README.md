# Project overview

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

# Azure Deployment

The project contains Terraform script to deploy the system to Azure.

## Big Picture

![Big Picture](../images/azure_iot_platform.png)

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
* [Azure IoT demo](https://github.com/Azure-Samples/IoTDemos/tree/master/ADT-SupplyChainDemo)
