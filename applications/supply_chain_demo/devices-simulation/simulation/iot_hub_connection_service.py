import json
import logging
import random

from azure.iot.device import Message
from azure.iot.device.aio import IoTHubDeviceClient
from azure.iot.hub import IoTHubRegistryManager
from models.device_model import DeviceModel
from msrest.exceptions import HttpOperationError

logger = logging.getLogger(__name__)
logger.setLevel(level=logging.INFO)


class IotHubConnectionService:
    '''Connection service for Azure IoT Hub or Azure IoT Edge Hub.'''

    def __init__(self,
                 iot_hub_host_name: str,
                 iot_hub_connection_string: str,
                 use_edge_hub: bool = False,
                 edge_host_name: str = None,
                 edge_ca_cert: str = None,
                 edge_device_id: str = None,
                 edge_device_scope: str = None) -> None:
        '''Initializer for a IoT Hub connection service client.

        :param str iot_hub_host_name: IoT Hub host name.
        :param str iot_hub_connection_string: IoTHub connection string
            used to authenticate connection with IoTHub.
        :param bool use_edge_hub: Uses IoT Edge Hub. Default value: False
        :param str edge_host_name: IoT Edge Hub host name.
            Default value: None.
        :param str edge_ca_cert: IoT Edge root CA certificate.
            Default value: None.
        :param str edge_device_id: Name (Id) of the edge device.
            Used if "edge_device_scope" is not specified. Default value: None.
        :param str edge_device_scope: Edge device "device_scope" parameter.
            Default value: None.
        '''
        self.registry_manager = IoTHubRegistryManager.from_connection_string(
            iot_hub_connection_string)
        self.iot_hub_host_name = iot_hub_host_name
        self.use_edge_hub = use_edge_hub
        self.edge_host_name = edge_host_name
        self.edge_ca_cert = edge_ca_cert
        self.edge_device_id = edge_device_id
        self.edge_device_scope = edge_device_scope

    def create_device(self,
                      device_id: str,
                      primary_key: str,
                      secondary_key: str) -> None:
        '''Creates a device identity on IoTHub using SAS authentication.

        :param str device_id: Name (Id) of the device.
        :param str primary_key: Primary authentication key.
        :param str secondary_key: Secondary authentication key.

        :returns: None.
        '''
        if self.use_edge_hub:
            if not self.edge_device_scope:
                self.edge_device_scope = self.registry_manager.get_device(
                    device_id=self.edge_device_id).as_dict().get('device_scope')
            device_scope = self.edge_device_scope
        else:
            device_scope = None
        device_created = False
        while not device_created:
            try:
                self.registry_manager.create_device_with_sas(
                    device_id=device_id,
                    primary_key=primary_key,
                    secondary_key=secondary_key,
                    status='enabled',
                    device_scope=device_scope
                )
                device_created = True
                logger.info(f'Device {device_id} created')
            except HttpOperationError as e:
                logger.warning(
                    'Creating device {} error: {}'.format(
                        device_id,
                        {'status_code': e.response.status_code,
                         'iothub-errorcode': e.response.headers.get(
                             'iothub-errorcode')}))
                if e.response.headers.get(
                        'iothub-errorcode') == "DeviceAlreadyExists":
                    device_created = True
                # Retry in case of "ThrottlingBacklogTimeout" or other error.

    def get_device_ids(self) -> list:
        '''Get names (Id) of devices from the IoTHub identity
           registry.

        :returns: List.
        '''
        devices = self.registry_manager.get_devices()
        return [device.as_dict().get('device_id') for device in devices]

    def delete_device(self, device_id: str) -> None:
        '''Deletes a device identity from IoTHub.

        :param str device_id: Name (Id) of the device.

        :returns: None.
        '''
        device_deleted = False
        while not device_deleted:
            try:
                self.registry_manager.delete_device(device_id=device_id)
                device_deleted = True
                logger.info(f'Device {device_id} deleted')
            except HttpOperationError as e:
                logger.warning(
                    'Deliting device {} error: {}'.format(
                        device_id,
                        {'status_code': e.response.status_code,
                         'iothub-errorcode': e.response.headers.get(
                             'iothub-errorcode')}))
                if e.response.headers.get(
                        'iothub-errorcode') == 'DeviceNotFound':
                    device_deleted = True
                # Retry in case of "ThrottlingBacklogTimeout" or other error.

    def get_device_client(self,
                          device_id: str,
                          primary_key: str) -> IoTHubDeviceClient:
        '''Create IoTHub device client.

        :param str device_id: Name (Id) of the device.
        :param str primary_key: Device primary authentication key.

        :returns IoTHubDeviceClient: An instance of an IoTHub client.
        '''
        connection_str = 'HostName={};DeviceId={};SharedAccessKey={}'.format(
            self.iot_hub_host_name, device_id, primary_key)
        if self.use_edge_hub:
            connection_str = ';'.join([
                connection_str,
                'GatewayHostName={}'.format(self.edge_host_name)])
            edge_kwargs = {'server_verification_cert': self.edge_ca_cert}
        else:
            edge_kwargs = {}
        device_client = IoTHubDeviceClient.create_from_connection_string(
            connection_string=connection_str, **edge_kwargs)
        return device_client

    async def send_message(
            self,
            device_client: IoTHubDeviceClient,
            device_model: DeviceModel,
            use_issue_values: bool) -> None:
        '''Sends a message to the Azure IoT Hub or Azure IoT Edge Hub.

        :param IoTHubDeviceClient device_client: The device IoTHub client.
        :param DeviceModel device_model: The device model.
        :param bool use_issue_values: Uses model issue values.

        :returns: None.
        '''
        telemetry_data_point = {}
        for property in device_model.properties:
            if use_issue_values:
                telemetry_data_point[property.name] = random.randint(
                    property.issue_min,
                    property.issue_max)
            else:
                telemetry_data_point[property.name] = random.randint(
                    property.min,
                    property.max)
        msg = Message(json.dumps(telemetry_data_point))
        msg.content_encoding = "utf-8"
        msg.content_type = "application/json"
        await device_client.send_message(msg)
