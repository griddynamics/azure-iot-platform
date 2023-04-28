"""Module which contains required constants for Azure Function."""

from enum import Enum


class DeviceType(Enum):
    """Class which represents enum object for different device types."""

    CONVEYOR = 0
    CUTTER = 1
    FACTORY = 2
    SHIPMENT = 3
    SHOP = 4
    STOREROOM = 5
    SUPPLIER = 6
    WAREHOUSE = 7
    UNKNOWN = 8


device_type_air_shipment_initials: str = "CA"
device_type_boat_shipment_initials: str = "CB"
device_type_conveyor_initials: str = "CV"
device_type_cutter_initials: str = "CU"
device_type_factory_initials: str = "FA"
device_type_truck_shipment_initials: str = "CT"
device_type_shop_initials: str = "RT"
device_type_storeroom_initials: str = "SR"
device_type_supplier_initials: str = "SP"
device_type_warehouse_initials: str = "WH"


conveyor_properties = ["Speed"]
cutter_properties = ["Speed"]
factory_properties = ["Efficiency", "Reliability", "OpenOrders"]
shipment_properties = [
    "Humidity",
    "Temperature",
    "Vibration",
    "EstimatedTimeOfArrival",
    "Location",
]
shop_properties = ["StockLevel", "OpenOrders"]
storeroom_properties = ["Humidity", "Temperature"]
supplier_properties = []
warehouse_properties = ["StockLevel"]
telemetries = ["SPEED", "HUMIDITY", "TEMPERATURE", "VIBRATION"]
