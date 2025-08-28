import requests

def ip_to_location(ip):
    try:
        response = requests.get(f"http://ip-api.com/json/{ip}")
        if response.status_code == 200:
            data = response.json()
            return {
                "lat": data.get("lat"),
                "lon": data.get("lon"),
                "city": data.get("city"),
                "country": data.get("country")
            }
    except Exception:
        pass
    return {"lat": None, "lon": None, "city": None, "country": None}