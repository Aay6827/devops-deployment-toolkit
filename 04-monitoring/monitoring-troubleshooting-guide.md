\# Monitoring \& Observability — Troubleshooting Guide



\## 1. Prometheus Target Shows DOWN



\*\*Symptoms\*\*

\- Prometheus reports the FastAPI target as DOWN.

\- Scrape errors appear in the Prometheus Targets page.



\*\*Checks\*\*



1\. Check container status:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml ps

```



2\. Inspect API logs:



```powershell

docker logs devops-toolkit-api

```



3\. Check the metrics endpoint:



```powershell

Invoke-WebRequest http://localhost:8000/metrics

```



\*\*Possible causes\*\*

\- API container is stopped or unhealthy.

\- Incorrect Prometheus target hostname.

\- Metrics endpoint is unavailable.

\- Docker network connectivity problems.



\*\*Resolution\*\*

\- Confirm the API service is healthy.

\- Confirm the Prometheus target is `devops-toolkit-api:8000`.

\- Confirm `metrics\_path` is `/metrics`.

\- Check container logs and Docker networking.



\## 2. Grafana Cannot Connect to Prometheus



\*\*Symptoms\*\*

\- Grafana displays a data-source connection error.

\- Dashboard panels show no data.



\*\*Checks\*\*



1\. Open Prometheus:



`http://localhost:9090`



2\. Verify that the API target is UP.



3\. Inspect Grafana logs:



```powershell

docker logs devops-toolkit-grafana

```



\*\*Possible causes\*\*

\- Prometheus container is unavailable.

\- Incorrect Grafana data-source URL.

\- Docker networking issues.



\*\*Resolution\*\*



The Grafana data source should use the internal Docker service address:



```text

http://prometheus:9090

```



Do not use `localhost:9090` inside the Grafana container. In that context, localhost refers to Grafana itself.



\## 3. Grafana Dashboard Is Missing



\*\*Symptoms\*\*

\- Dashboard does not appear in Grafana.

\- The DevOps Toolkit folder is empty.



\*\*Checks\*\*



1\. Verify the dashboard JSON exists:



```powershell

Test-Path ".\\04-monitoring\\grafana\\devops-toolkit-dashboard.json"

```



2\. Inspect Grafana logs:



```powershell

docker logs devops-toolkit-grafana

```



3\. Verify dashboard provisioning configuration:



```text

04-monitoring/grafana/provisioning/dashboards/dashboards.yml

```



\*\*Possible causes\*\*

\- Incorrect dashboard JSON path.

\- Invalid provisioning YAML.

\- Dashboard file not mounted into the container.

\- JSON parsing errors.



\*\*Resolution\*\*

\- Validate the JSON file.

\- Confirm the Compose dashboard volume mount.

\- Confirm the provisioning path is `/var/lib/grafana/dashboards`.

\- Restart the Grafana service after correcting configuration.



\## 4. Grafana Panels Show No Data



\*\*Symptoms\*\*

\- Dashboard loads, but panels are empty.

\- Prometheus queries return no results.



\*\*Checks\*\*



1\. Generate API traffic:



```powershell

1..20 | ForEach-Object {

&#x20;   Invoke-RestMethod http://localhost:8000/ | Out-Null

}

```



2\. Check the metrics endpoint:



```powershell

Invoke-WebRequest http://localhost:8000/metrics

```



3\. Check Prometheus targets:



`http://localhost:9090/targets`



\*\*Possible causes\*\*

\- No application traffic.

\- Prometheus has not scraped the latest metrics.

\- Incorrect PromQL query.

\- Incorrect dashboard time range.



\*\*Resolution\*\*

\- Generate test requests.

\- Allow time for Prometheus to scrape the metrics.

\- Verify the query in Prometheus before changing the dashboard.

\- Extend the Grafana time range if necessary.



\## 5. API Container Is Unhealthy



\*\*Symptoms\*\*

\- Docker reports the API container as unhealthy.

\- Prometheus cannot scrape application metrics.



\*\*Checks\*\*



```powershell

docker inspect devops-toolkit-api

```



Inspect application logs:



```powershell

docker logs devops-toolkit-api

```



\*\*Possible causes\*\*

\- Application startup failure.

\- Missing Python dependencies.

\- Health endpoint not responding.

\- Container resource constraints.



\*\*Resolution\*\*

\- Verify the application starts correctly.

\- Confirm `/health` returns HTTP 200.

\- Check Docker build output and application logs.

\- Rebuild the image after dependency or application changes.



\## 6. Port Already in Use



\*\*Symptoms\*\*

\- Docker Compose fails to start a service.

\- Error indicates that a port is already allocated.



\*\*Checks\*\*



```powershell

docker ps

```



\*\*Possible causes\*\*

\- Another container uses port 8000, 9090, or 3000.

\- Another local application uses one of those ports.



\*\*Resolution\*\*

\- Identify the process or container using the port.

\- Stop the conflicting service if appropriate.

\- Alternatively, change the host-side port mapping in `compose.yaml`.



\## 7. Useful Diagnostic Commands



Check service status:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml ps

```



View all service logs:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml logs

```



Follow logs:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml logs -f

```



Restart the monitoring environment:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml restart

```



Validate Compose configuration:



```powershell

docker compose -f .\\04-monitoring\\compose.yaml config

```



\## Operational Note



These procedures are intended for a local educational environment. Production troubleshooting should also consider authentication, TLS, network policies, resource limits, alerting, log retention, and monitoring-system availability.



