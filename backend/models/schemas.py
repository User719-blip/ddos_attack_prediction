from pydantic import BaseModel

class Location(BaseModel):
    lat: float | None
    lon: float | None
    city: str | None
    country: str | None

class AttackEvent(BaseModel):
    attack: int
    location: Location
    timestamp: str