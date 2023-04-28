from dataclasses import dataclass


@dataclass
class DeviceProperty:
    name: str
    min: int
    max: int
    issue_min: int = 0
    issue_max: int = 0
