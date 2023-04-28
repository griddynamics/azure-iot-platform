from dataclasses import dataclass


@dataclass
class SimulationOptions:
    air_shipment_devices: int = 14
    boat_shipment_devices: int = 10
    conveyor_devices: int = 20
    cutter_devices: int = 20
    factory_devices: int = 5
    shop_devices: int = 20
    store_room_devices: int = 20
    supplier_devices: int = 8
    truck_shipment_devices: int = 26
    ware_house_devices: int = 8
