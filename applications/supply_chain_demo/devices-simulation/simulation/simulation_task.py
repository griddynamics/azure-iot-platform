import asyncio
import logging
import random
from datetime import datetime, timedelta

from models.device_model import DeviceModel
from models.simulated_device import SimulatedDevice
from simulation.device_models import (air_shipment_model, boat_shipment_model,
                                      conveyor_model, cutter_model,
                                      factory_model, shop_model,
                                      store_room_model, supplier_model,
                                      truck_shipment_model, ware_house_model)
from simulation.iot_hub_connection_service import IotHubConnectionService
from simulation.simulation import Simulation
from simulation.simulation_options import SimulationOptions

logger = logging.getLogger(__name__)
logger.setLevel(level=logging.INFO)


class SimulationTask:
    '''Simulation task to prepare and run devices simulation'''

    def __init__(
        self,
        options: SimulationOptions,
        connection_service: IotHubConnectionService,
        minutes_to_run: float,
        devices_primary_key: str,
        devices_secondary_key: str,
    ) -> None:
        '''Initializer for a Simulation Task.

        :param SimulationOptions options:
        :param IotHubConnectionService connection_service:
        :param float minutes_to_run: Number of minutes for simulation to run.
        :param str devices_primary_key: Primary devices authentication key
            (one for all devices).
        :param str devices_secondary_key: Secondary devices authentication key
            (one for all devices).
        '''
        self.options = options
        self.connection_service = connection_service
        self.minutes_to_run = minutes_to_run
        self.devices_primary_key = devices_primary_key
        self.devices_secondary_key = devices_secondary_key
        self.simulation = self._get_simulation(options=options)

    def _get_simulation(self, options) -> Simulation:
        '''Initialize simulation with simulated devices

        :returns Simulation: Initialized simulation.
        '''
        devices = []
        devices.extend(self._get_simulated_devices(
            n_devices=options.air_shipment_devices,
            model=air_shipment_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.boat_shipment_devices,
            model=boat_shipment_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.conveyor_devices,
            model=conveyor_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.cutter_devices,
            model=cutter_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.factory_devices,
            model=factory_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.truck_shipment_devices,
            model=truck_shipment_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.shop_devices,
            model=shop_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.store_room_devices,
            model=store_room_model,
            issue_device_indexes=[1]))
        devices.extend(self._get_simulated_devices(
            n_devices=options.supplier_devices,
            model=supplier_model))
        devices.extend(self._get_simulated_devices(
            n_devices=options.ware_house_devices,
            model=ware_house_model))
        return Simulation(devices=devices)

    def _get_simulated_devices(self,
                               n_devices: int,
                               model: DeviceModel,
                               issue_device_indexes: list = [],
                               ) -> list:
        '''Initialize simulated devices

        :param int n_devices: Number of devices to initialize.
        :param DeviceModel model: Device model.
        :param list issue_device_indexes: List of device indexes to generate issue ivalues.
            Default value: [].

        :returns list[SimulatedDevice]: List of simulated devices.
        '''
        devices = []
        for i in range(n_devices):
            devices.append(SimulatedDevice(
                device_id='{}{}'.format(
                    model.base_name,
                    model.initial_id_reference + i),
                model=model,
                use_issue_values=i in issue_device_indexes))
        return devices

    def create_devices(self) -> None:
        '''
        Creates devices identities on IoTHub.

        :returns: None.
        '''
        logger.info(f'Creating devices...')
        device_ids: list = self.connection_service.get_device_ids()
        for device in self.simulation.devices:
            if device.device_id not in device_ids:
                self.connection_service.create_device(
                    device_id=device.device_id,
                    primary_key=self.devices_primary_key,
                    secondary_key=self.devices_secondary_key)

    def delete_devices(self):
        '''Deletes devices identitys from IoTHub.

        :returns: None.
        '''
        for device in self.simulation.devices:
            self.connection_service.delete_device(
                device_id=device.device_id)

    async def start(self):
        '''Starts devices simulation
        
        :returns: None.
        '''
        # Create and connect IoTHub device clients
        logger.info(f'Connecting devices...')
        device_clients = {}
        tasks = []
        for device in self.simulation.devices:
            device.next_generation = datetime.now() + timedelta(
                seconds=random.randint(
                    device.min_seconds_before_generation,
                    device.max_seconds_before_generation))
            client = self.connection_service.get_device_client(
                device_id=device.device_id,
                primary_key=self.devices_primary_key)
            device_clients[device.device_id] = client
            tasks.append(client.connect())
        await asyncio.gather(*tasks)
        # Start simulation
        self.simulation.started_at = datetime.now()
        self.simulation.finished_at = self.simulation.started_at + timedelta(
            minutes=self.minutes_to_run)
        logger.info(f'Starting simulation for {self.minutes_to_run} minutes')
        total_messages = 0
        while datetime.now() < self.simulation.finished_at:
            tasks = []
            for device in self.simulation.devices:
                if datetime.now() > device.next_generation:
                    tasks.append(
                        self.connection_service.send_message(
                            device_client=device_clients[device.device_id],
                            device_model=device.model,
                            use_issue_values=device.use_issue_values,
                        ))
                    device.messages_counter += 1
                    device.next_generation = datetime.now() + timedelta(
                        seconds=random.randint(
                            device.min_seconds_before_generation,
                            device.max_seconds_before_generation))
            await asyncio.gather(*tasks)
            if len(tasks):
                logger.info(f'Messages sent: {len(tasks)}')
                total_messages += len(tasks)
        logger.info(f'Total messages sent: {total_messages}')
        # Shutdown IoTHub device clients
        tasks = [client.shutdown()
                 for client in device_clients.values()]
        await asyncio.gather(*tasks)
