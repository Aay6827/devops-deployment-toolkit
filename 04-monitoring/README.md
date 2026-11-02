\# Module 04 — Monitoring \& Observability



\## Overview



This module demonstrates application monitoring and observability using Prometheus and Grafana.



It integrates with the FastAPI application from Module 02 and collects application metrics, including HTTP request rates, response times, and process memory usage.



The monitoring environment runs through Docker Compose.



\## Architecture



```text

&#x20;                ┌──────────────────────┐

&#x20;                │   FastAPI Application│

&#x20;                │     Port: 8000       │

&#x20;                │                      │

&#x20;                │  /health             │

&#x20;                │  /ready              │

&#x20;                │  /metrics            │

&#x20;                └──────────┬───────────┘

&#x20;                           │

&#x20;                           │ Metrics scraping

&#x20;                           ▼

&#x20;                ┌──────────────────────┐

&#x20;                │      Prometheus      │

&#x20;                │      Port: 9090      │

&#x20;                └──────────┬───────────┘

&#x20;                           │

&#x20;                           │ PromQL queries

&#x20;                           ▼

&#x20;                ┌──────────────────────┐

&#x20;                │       Grafana        │

&#x20;                │      Port: 3000      │

&#x20;                │                      │

&#x20;                │  Monitoring Dashboard│

&#x20;                └──────────────────────┘

```



\## Technologies



\- Docker and Docker Compose

\- FastAPI

\- Prometheus

\- Grafana

\- PromQL

\- Python



\## Features



\- Application health and readiness endpoints.

\- Prometheus metrics exposed through `/metrics`.

\- Automated Prometheus scraping every 15 seconds.

\- Grafana dashboard provisioning from a JSON file.

\- Persistent Prometheus and Grafana data volumes.

\- Container health checks and restart policies.

\- Four monitoring panels.



\## Dashboard Panels



| Panel | Description |

|---|---|

| Application Memory Usage | Tracks application process memory |

| Average API Response Time | Calculates average HTTP request duration over five minutes |

| HTTP Requests by Status | Displays request rates grouped by HTTP status |

| Application Request Rate | Displays total HTTP request rate, excluding metrics scraping |



\## Project Structure



```text

04-monitoring/

├── prometheus/

│   └── prometheus.yml

├── grafana/

│   ├── devops-toolkit-dashboard.json

│   └── provisioning/

│       ├── datasources/

│       │   └── prometheus.yml

│       └── dashboards/

│           └── dashboards.yml

└── compose.yaml

```



\## Prerequisites



\- Docker Desktop

\- Docker Compose

\- Internet access for pulling container images



\## Start the Monitoring Environment



Run from the repository root:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml up -d

```



Check container status:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml ps

```



\## Access the Services



| Service | URL |

|---|---|

| FastAPI | http://localhost:8000 |

| API Health | http://localhost:8000/health |

| API Readiness | http://localhost:8000/ready |

| Prometheus Metrics | http://localhost:8000/metrics |

| Prometheus UI | http://localhost:9090 |

| Grafana | http://localhost:3000 |



Grafana local lab credentials:



\- Username: `admin`

\- Password: Set through your local environment configuration.



Do not use development credentials in production.



\## Prometheus Configuration



Prometheus scrapes the FastAPI application using:



\- Target: `devops-toolkit-api:8000`

\- Metrics path: `/metrics`

\- Scrape interval: 15 seconds



The target can be checked through the Prometheus interface:



`http://localhost:9090/targets`



\## Example PromQL Queries



Application memory:



```promql

process\_resident\_memory\_bytes

```



Application request rate:



```promql

sum(rate(http\_requests\_total{handler!="/metrics"}\[5m]))

```



Average API response time:



```promql

sum(rate(http\_request\_duration\_seconds\_sum\[5m]))

/

sum(rate(http\_request\_duration\_seconds\_count\[5m]))

```



HTTP requests grouped by status:



```promql

sum by (status) (rate(http\_requests\_total{handler!="/metrics"}\[5m]))

```



\## Generate Test Traffic



Run from PowerShell:



```powershell

1..20 | ForEach-Object {

&#x20;   Invoke-RestMethod http://localhost:8000/ | Out-Null

}

```



Refresh Grafana to observe the metrics.



\## Stop the Monitoring Environment



```powershell

docker compose -f .\\04-monitoring\\compose.yaml down

```



To remove containers and persistent volumes:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml down -v

```



Warning: The second command deletes stored Prometheus and Grafana data.



\## Learning Outcomes



\- Implemented application-level Prometheus instrumentation.

\- Configured Prometheus metric scraping.

\- Connected Grafana to Prometheus.

\- Built a four-panel application monitoring dashboard.

\- Configured automatic dashboard provisioning.

\- Used Docker Compose to orchestrate monitoring services.

\- Verified application endpoints through automated tests.



\## Disclaimer



This is an independent educational project built for learning and portfolio demonstration. It is not affiliated with or endorsed by any employer or third-party company. Production monitoring requires environment-specific security, access control, retention, alerting, and resource configuration.



