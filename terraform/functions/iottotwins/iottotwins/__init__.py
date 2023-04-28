"""Main azure function file which implements logic of updating digital twins
based on different types of devices."""
import json
import logging
import os
from typing import NoReturn

import azure.functions as func
from azure.digitaltwins.core import DigitalTwinsClient
from azure.identity import DefaultAzureCredential, ManagedIdentityCredential

from .constants import (
    DeviceType,
    conveyor_properties,
    cutter_properties,
    factory_properties,
    shipment_properties,
    shop_properties,
    storeroom_properties,
    supplier_properties,
    telemetries,
    warehouse_properties,
)
from .utils import get_device_type

ADT_INSTANCE_URL = os.getenv("ADT_SERVICE_URL")


def main(event: func.EventGridEvent) -> NoReturn:
    """Entrypoint function.
    Args:
        event (EventGridEvent): input data from trigger
    Returns:
        NoReturn
    """

    if (ADT_INSTANCE_URL is None) or (ADT_INSTANCE_URL == ""):
        logging.error('Application setting "ADT_SERVICE_URL" not set')

    logging.info(event)
    try:
        if (event is not None) or (event.get_json() is not None):
            # cred: ManagedIdentityCredential = ManagedIdentityCredential(
            #     client_id="https://digitaltwins.azure.net"
            #     )
            cred = DefaultAzureCredential()
            client: DigitalTwinsClient = DigitalTwinsClient(
                endpoint=ADT_INSTANCE_URL,
                credential=cred,
            )
            logging.info(json.dumps(event.get_json()))
            device_message = event.get_json()  # return dict from event.__data
            logging.info("Device message: %s", device_message)
            #device_id: str = device_message["systemProperties"][
            #    "iothub-connection-device-id"
            #]
            body = device_message["body"]
            device_id: str = body.get('device_id')
            device_type = get_device_type(device_id)

            if device_type == DeviceType.CUTTER:
                logging.info("Device type: Cutter")
                update_digital_twin_property(client, device_id, body, cutter_properties)
            elif device_type == DeviceType.CONVEYOR:
                logging.info("Device type: Conveyor")
                update_digital_twin_property(
                    client, device_id, body, conveyor_properties
                )
            elif device_type == DeviceType.FACTORY:
                logging.info("Device type: Factory")
                update_digital_twin_property(
                    client, device_id, body, factory_properties
                )
            elif device_type == DeviceType.SHIPMENT:
                logging.info("Device type: Shipment")
                update_digital_twin_property(
                    client, device_id, body, shipment_properties
                )
            elif device_type == DeviceType.SHOP:
                logging.info("Device type: Shop")
                update_digital_twin_property(client, device_id, body, shop_properties)
            elif device_type == DeviceType.STOREROOM:
                logging.info("Device type: Storeroom")
                update_digital_twin_property(
                    client, device_id, body, storeroom_properties
                )
            elif device_type == DeviceType.SUPPLIER:
                logging.info("Device type: Supplier")
                update_digital_twin_property(
                    client, device_id, body, supplier_properties
                )
            elif device_type == DeviceType.WAREHOUSE:
                logging.info("Device type: Warehouse")
                update_digital_twin_property(
                    client, device_id, body, warehouse_properties
                )
            else:
                logging.error("Unknown device type.")

            logging.info("DigitalTwin Updated.")

    except Exception as exp:  # pylint: disable=broad-exception-caught
        logging.error("Error in ingest function: %s", exp)


def update_digital_twin_property(
    client: DigitalTwinsClient, device_id: str, body, properties: list[str]
) -> NoReturn:
    """Funtion which updates digital twins properties.
    Args:
        client (DigitalTwinsClient): initialized digital twin client
        device_id (str): id of the specific device
        body (dict): represents device's json body
        properties (list[str]): represents list of available properties for device
    Returns:
        NoReturn
    """

    for prop in properties:
        property_token = body.get(prop)
        if property_token is not None:
            if prop.upper() in telemetries:
                data = {}
                #data[prop] = prop
                data[prop] = property_token
                client.publish_telemetry(device_id, data)
            else:
                patch = [{"op": "replace", "path": f"/{prop}", "value": property_token}]
                client.update_digital_twin(device_id, patch)
