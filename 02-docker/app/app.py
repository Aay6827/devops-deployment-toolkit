from fastapi import FastAPI
from datetime import datetime, timezone
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(
    title="DevOps Deployment Toolkit",
    description="Sample containerised application with Prometheus monitoring",
    version="1.1.0"
)

# Expose HTTP application metrics for Prometheus
Instrumentator().instrument(app).expose(app)


@app.get("/")
def home():
    return {
        "application": "DevOps Deployment Toolkit",
        "module": "02 - Docker + 04 - Monitoring",
        "status": "running"
    }


@app.get("/health")
def health():
    return {
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat()
    }


@app.get("/ready")
def readiness():
    return {
        "status": "ready"
    }