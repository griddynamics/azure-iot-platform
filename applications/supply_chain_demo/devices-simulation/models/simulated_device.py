from dataclasses import dataclass
from datetime import datetime

from models.device_model import DeviceModel


@dataclass
class SimulatedDevice:
    device_id: str
    model: DeviceModel
    next_generation: datetime = None
    use_issue_values: bool = False
    min_seconds_before_generation: int = 3
    max_seconds_before_generation: int = 6
    messages_counter: int = 0
