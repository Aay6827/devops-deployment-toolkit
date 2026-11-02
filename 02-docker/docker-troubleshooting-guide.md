

\# Docker Troubleshooting Guide



\## Scenario 1 - Container exits immediately



\*\*Symptoms:\*\* Container status shows Exited.



\*\*Investigation:\*\*

```powershell

docker ps -a

docker logs devops-toolkit-api

```



\*\*Possible causes:\*\*

\- Application startup error

\- Missing Python dependency

\- Incorrect Uvicorn import path

\- Invalid container command



\*\*Resolution:\*\* Inspect logs, correct the configuration, and rebuild.



\## Scenario 2 - Port already allocated



\*\*Symptoms:\*\* Docker cannot publish port 8000.



\*\*Investigation:\*\*

```powershell

Get-NetTCPConnection -LocalPort 8000 -ErrorAction SilentlyContinue

```



\*\*Resolution:\*\* Stop the conflicting process safely or change the host port in Compose.



\## Scenario 3 - Container reports unhealthy



\*\*Symptoms:\*\* Container is running but health status is unhealthy.



\*\*Investigation:\*\*

```powershell

docker inspect devops-toolkit-api

docker logs devops-toolkit-api

Invoke-RestMethod http://localhost:8000/health

```



\*\*Possible causes:\*\*

\- Application has not started

\- Health endpoint returns an error

\- Health-check command fails

\- Application is overloaded



\## Scenario 4 - Application changes are not visible



\*\*Symptoms:\*\* Old application behaviour remains after editing source files.



\*\*Resolution:\*\*

```powershell

docker compose -f .\\02-docker\\compose.yaml up -d --build

```



\## Scenario 5 - Permission denied



\*\*Symptoms:\*\* Application cannot write to a directory.



\*\*Investigation:\*\*

```powershell

docker exec devops-toolkit-api id

docker exec devops-toolkit-api ls -la /app

```



\*\*Resolution:\*\* Review directory ownership and permissions. Do not solve permission issues by running the application as root without a clear security justification.



\## Operational Reminder



Always inspect logs and container state before restarting services. Preserve relevant evidence when investigating production incidents.



