

\# Module 02 - Docker Deployment Toolkit



\## Objective



Build and run a containerised FastAPI application using Docker and Docker Compose.



This module demonstrates fundamental containerisation, deployment, health monitoring, and troubleshooting practices.



\## Architecture



\- Application: FastAPI

\- Runtime: Python 3.12

\- Containerisation: Docker

\- Orchestration: Docker Compose

\- Application port: 8000

\- Container user: appuser (non-root)



\## Project Structure



```text

02-docker/

├── app/

│   └── app.py

├── .dockerignore

├── compose.yaml

├── Dockerfile

├── requirements.txt

├── README.md

└── docker-troubleshooting-guide.md

```



\## Prerequisites



\- Docker Desktop

\- PowerShell

\- Git



\## Validate Compose Configuration



```powershell

docker compose -f .\\02-docker\\compose.yaml config

```



\## Build and Start



```powershell

docker compose -f .\\02-docker\\compose.yaml up -d --build

```



\## Verify Container Status



```powershell

docker compose -f .\\02-docker\\compose.yaml ps

```



\## Application Endpoints



| Endpoint | Purpose |

|---|---|

| `/` | Application information |

| `/health` | Health check |

| `/ready` | Readiness check |



Test using:



```powershell

Invoke-RestMethod http://localhost:8000/

Invoke-RestMethod http://localhost:8000/health

Invoke-RestMethod http://localhost:8000/ready

```



\## Container Health



```powershell

docker inspect --format '{{.State.Health.Status}}' devops-toolkit-api

```



\## Application Logs



```powershell

docker logs devops-toolkit-api

```



\## Security Practices



\- Run the application as a non-root user.

\- Use a slim Python base image.

\- Exclude unnecessary files through `.dockerignore`.

\- Avoid storing credentials in source code.

\- Configure health checks for application monitoring.



\## Troubleshooting



Refer to \[docker-troubleshooting-guide.md](docker-troubleshooting-guide.md).



\## Stop the Application



```powershell

docker compose -f .\\02-docker\\compose.yaml down

```



\## Learning Outcomes



\- Docker image creation

\- Container lifecycle management

\- Docker Compose deployment

\- Application health checks

\- Container logs and troubleshooting

\- Basic container security



\## Disclaimer



This is an independent educational portfolio project. It does not contain proprietary employer code, internal systems, or customer information.



