from fastapi import FastAPI
from data.streamer import DataStreamer
from domain.predictor import Predictor
from domain.geolocator import ip_to_location
from models.schemas import AttackEvent, Location

app = FastAPI()
# add the these data 
streamer = DataStreamer("data/dummy_dataset.csv")
predictor = Predictor("ml_model/model.pkl")

@app.get("/next_event", response_model=AttackEvent)
def get_next_event():
    row = streamer.get_next()
    if not row:
        return AttackEvent(attack=0, location=Location(lat=None, lon=None, city=None, country=None), timestamp="")
    # Adjust feature selection as per your dataset
    features = {k: v for k, v in row.items() if k not in ["src_ip", "timestamp"]}
    attack = predictor.predict(features)
    location = ip_to_location(row["src_ip"])
    return AttackEvent(attack=attack, location=Location(**location), timestamp=row["timestamp"])