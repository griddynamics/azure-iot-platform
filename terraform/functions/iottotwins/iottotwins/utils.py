"""Module contains utilities for Azure Function."""

from .constants import (
    DeviceType,
    device_type_air_shipment_initials,
    device_type_boat_shipment_initials,
    device_type_conveyor_initials,
    device_type_cutter_initials,
    device_type_factory_initials,
    device_type_shop_initials,
    device_type_storeroom_initials,
    device_type_supplier_initials,
    device_type_truck_shipment_initials,
    device_type_warehouse_initials,
)


def get_device_type(device_id: str) -> DeviceType:
    """Returns device type based on initials.

    Args:
        device_id: str - ID of the specific devices

    Returns:
        DeviceType
    """
    if (
        (device_type_air_shipment_initials in device_id.upper())
        or (device_type_boat_shipment_initials in device_id.upper())
        or (device_type_truck_shipment_initials in device_id.upper())
    ):
        return DeviceType.SHIPMENT
    elif device_type_conveyor_initials in device_id.upper():
        return DeviceType.CONVEYOR
    elif device_type_cutter_initials in device_id.upper():
        return DeviceType.CUTTER
    elif device_type_factory_initials in device_id.upper():
        return DeviceType.FACTORY
    elif device_type_shop_initials in device_id.upper():
        return DeviceType.SHOP
    elif device_type_storeroom_initials in device_id.upper():
        return DeviceType.STOREROOM
    elif device_type_supplier_initials in device_id.upper():
        return DeviceType.SUPPLIER
    elif device_type_warehouse_initials in device_id.upper():
        return DeviceType.WAREHOUSE
    else:
        return DeviceType.UNKNOWN
