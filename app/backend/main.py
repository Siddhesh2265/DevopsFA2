from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

# Instrument FastAPI with Prometheus metrics
Instrumentator().instrument(app).expose(app)

@app.get("/")
def read_root():
    return {"status": "ok", "message": "Backend API operational"}

@app.get("/api/data")
def get_data():
    return {"items": ["item1", "item2", "item3"]}