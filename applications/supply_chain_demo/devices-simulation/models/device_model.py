from dataclasses import dataclass


@dataclass
class DeviceModel:
    base_name: str
    initial_id_reference: int
    properties: list
