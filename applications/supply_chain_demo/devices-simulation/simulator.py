import argparse
import asyncio
import json
import logging

from simulation.iot_hub_connection_service import IotHubConnectionService
from simulation.simulation_options import SimulationOptions
from simulation.simulation_task import SimulationTask

logger = logging.getLogger(__name__)


def parse_command_line_args():
    '''Parse command line arguments.'''
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--config_path', default='config.json',
        help='Config json file path')
    return parser.parse_args()


def main():
    logging.basicConfig(level=logging.WARN)
    arg_parser = parse_command_line_args()
    with open(arg_parser.config_path) as file:
        config = json.load(file)
    use_edge_hub = config.get('use_edge_hub')
    if use_edge_hub:
        with open(config['edge_ca_cert_path']) as f:
            edge_ca_cert = f.read()
        edge_kwargs = {
            'use_edge_hub': use_edge_hub,
            'edge_host_name': config['edge_host_name'],
            'edge_ca_cert': edge_ca_cert,
            'edge_device_id': config['edge_device_id'],
        }
    else:
        edge_kwargs = {}
    connection_service = IotHubConnectionService(
        iot_hub_host_name=config['iot_hub_host_name'],
        iot_hub_connection_string=config['iot_hub_connection_string'],
        **edge_kwargs,
    )
    simulation_options = SimulationOptions()
    simulation_task = SimulationTask(
        options=simulation_options,
        connection_service=connection_service,
        devices_primary_key=config['devices_primary_key'],
        devices_secondary_key=config['devices_secondary_key'],
        minutes_to_run=config['minutes_to_run'],
    )
    # Create devices identitys on IoTHub
    simulation_task.create_devices()
    # Run simulation
    asyncio.run(simulation_task.start())


if __name__ == '__main__':
    main()
