from fastapi import FastAPI
from datetime import datetime, timezone

app = FastAPI(
    title="DevOps Deployment Toolkit",
    description="Sample containerised application",
    version="1.0.0"
)

@app.get("/")
def home():
    return {
        "application": "DevOps Deployment Toolkit",
        "module": "02 - Docker",
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
