# Backend Workflow and CSV Format

## 1. How the Backend Works

1. **Data Streaming**  
   - The backend uses a class (`DataStreamer`) to read your CSV file row by row, simulating real-time data streaming.
   - Each time the frontend requests `/next_event`, the backend returns the next row as if it just arrived.

2. **Prediction**  
   - The backend extracts the relevant features from the row (excluding things like IP and timestamp).
   - It passes these features to your trained ML model (loaded from `model.pkl`) to predict if an attack is happening (1) or not (0).

3. **Geolocation**  
   - If the row contains an IP address, the backend uses a geolocation API to convert the IP to a general location (latitude, longitude, city, country).

4. **API Response**  
   - The backend sends a JSON response to the frontend with:
     - The prediction (attack: 0 or 1)
     - The location (lat/lon/city/country)
     - The timestamp

5. **Frontend Integration**  
   - The frontend polls this endpoint, and if an attack is detected, it shows the location on the globe.

---

## 2. How the CSV File Should Look

Your CSV should have:
- One row per network event/connection.
- Columns for all features your ML model needs (e.g., protocol, packet size, etc.).
- A column for the source IP (for geolocation).
- A timestamp column (optional, but useful for display).

**Example CSV:**

| timestamp           | src_ip        | protocol | packet_size | ... | label |
|---------------------|---------------|----------|-------------|-----|-------|
| 2025-08-26 10:00:00 | 8.8.8.8       | TCP      | 512         | ... | 1     |
| 2025-08-26 10:00:01 | 1.1.1.1       | UDP      | 128         | ... | 0     |

- `timestamp`: When the event happened.
- `src_ip`: Source IP address (for geolocation).
- `protocol`, `packet_size`, ...: Features for your ML model.
- `label`: (Optional) 1 for attack, 0 for normal (used for training, not needed for prediction).

**Note:**  
- The backend expects the same feature columns as your ML model was trained on.
- The `src_ip` column is used for mapping to a location.

---

Let me know if you want a sample CSV file or help adjusting your backend to your dataset!
