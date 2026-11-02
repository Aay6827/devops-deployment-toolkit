
from fastapi.testclient import TestClient

from app.app import app

client = TestClient(app)


def test_home_endpoint():
    response = client.get("/")

    assert response.status_code == 200
    assert response.json()["application"] == "DevOps Deployment Toolkit"
    assert response.json()["module"] == "02 - Docker"
    assert response.json()["status"] == "running"


def test_health_endpoint():
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "healthy"
    assert "timestamp" in response.json()


def test_readiness_endpoint():
    response = client.get("/ready")

    assert response.status_code == 200
    assert response.json()["status"] == "ready"
