from models.device_model import DeviceModel
from models.device_property import DeviceProperty

air_shipment_model = DeviceModel(
    base_name='CA23251-',
    initial_id_reference=41,
    properties=[
        DeviceProperty(name='Humidity', min=60, max=70),
        DeviceProperty(name='Temperature', min=82, max=90),
        DeviceProperty(name='Vibration', min=65, max=75),
    ]
)
boat_shipment_model = DeviceModel(
    base_name='CB23251-',
    initial_id_reference=12,
    properties=[
        DeviceProperty(name='Humidity', min=60, max=70),
        DeviceProperty(name='Temperature', min=82, max=90),
        DeviceProperty(name='Vibration', min=65, max=75),
    ]
)
conveyor_model = DeviceModel(
    base_name='CV',
    initial_id_reference=90321,
    properties=[
        DeviceProperty(name='Speed', min=60, max=70),
    ]
)
cutter_model = DeviceModel(
    base_name='CU',
    initial_id_reference=90447,
    properties=[
        DeviceProperty(name='Speed', min=30, max=50),
    ]
)
factory_model = DeviceModel(
    base_name='FA',
    initial_id_reference=44210,
    properties=[
        DeviceProperty(name='Efficiency', min=85, max=95),
        DeviceProperty(name='Reliability', min=87, max=93),
        DeviceProperty(name='OpenOrders', min=45, max=55),
    ]
)
truck_shipment_model = DeviceModel(
    base_name='CT23251-',
    initial_id_reference=71,
    properties=[
        DeviceProperty(name='Humidity', min=85, max=95),
        DeviceProperty(name='Temperature', min=90, max=95),
        DeviceProperty(name='Vibration', min=20, max=50),
    ]
)
shop_model = DeviceModel(
    base_name='RT44658',
    initial_id_reference=79,
    properties=[
        DeviceProperty(name='StockLevel', min=61, max=66),
        DeviceProperty(name='OpenOrders', min=45, max=50),
    ]
)
store_room_model = DeviceModel(
    base_name='SR906',
    initial_id_reference=36,
    properties=[
        DeviceProperty(name='Humidity', min=55, max=65,
                       issue_min=78, issue_max=92),
        DeviceProperty(name='Temperature', min=55, max=60),
    ]
)
supplier_model = DeviceModel(
    base_name='SP658',
    initial_id_reference=75,
    properties=[]
)
ware_house_model = DeviceModel(
    base_name='WH89125-',
    initial_id_reference=17,
    properties=[
        DeviceProperty(name='StockLevel', min=20, max=40),
    ]
)
