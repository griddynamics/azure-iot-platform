from dataclasses import dataclass
from datetime import datetime


@dataclass
class Simulation:
    devices: list
    started_at: datetime = None
    finished_at: datetime = None
