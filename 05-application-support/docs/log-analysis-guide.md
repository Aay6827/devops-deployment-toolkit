\# Application Support — Log Analysis Guide



\## 1. Overview



Application logs provide evidence about application behaviour, errors, performance issues, and service dependencies.



This guide explains how to investigate logs in a fictional e-commerce microservices environment.



\## 2. Common Log Levels



| Level | Purpose | Example |

|---|---|---|

| DEBUG | Detailed diagnostic information | Request processing details |

| INFO | Normal application activity | Order successfully created |

| WARNING | Unexpected but recoverable condition | Retry attempt detected |

| ERROR | Operation failed | Database connection failure |

| CRITICAL | Severe failure affecting service operation | Application startup failure |



\## 3. Common Log Fields



| Field | Description |

|---|---|

| timestamp | Date and time of the event |

| level | Log severity |

| service | Application or microservice name |

| correlation\_id | Identifier linking related requests |

| request\_id | Identifier for an individual request |

| message | Human-readable event description |

| status\_code | HTTP response status |

| duration\_ms | Request processing time |



\## 4. Example Application Logs



```text

2026-11-03T10:15:21Z INFO service=order-service correlation\_id=COR-1001 message="Order created successfully"



2026-11-03T10:16:08Z WARNING service=fulfilment-service correlation\_id=COR-1002 message="Downstream response delayed"



2026-11-03T10:16:12Z ERROR service=payment-service correlation\_id=COR-1003 message="Database connection timeout"



2026-11-03T10:17:40Z CRITICAL service=inventory-service correlation\_id=COR-1004 message="Inventory database unavailable"

```



All records above are fictional training examples.



\## 5. Linux Log Investigation Commands



\### View the last 100 lines



```bash

tail -n 100 application.log

```



\### Follow logs in real time



```bash

tail -f application.log

```



\### Search for errors



```bash

grep -i "error" application.log

```



\### Search for a correlation ID



```bash

grep "COR-1003" application.log

```



\### Filter warning and error messages



```bash

grep -Ei "warning|error|critical" application.log

```



\### Search logs within a time window



```bash

grep "2026-11-03T10:16" application.log

```



\### Count error messages



```bash

grep -ic "error" application.log

```



\## 6. PowerShell Log Investigation



\### Search for errors



```powershell

Select-String -Path ".\\application.log" -Pattern "ERROR"

```



\### Search by correlation ID



```powershell

Select-String -Path ".\\application.log" -Pattern "COR-1003"

```



\### Find warning and error records



```powershell

Select-String -Path ".\\application.log" -Pattern "WARNING|ERROR|CRITICAL"

```



\### Count error records



```powershell

(Select-String -Path ".\\application.log" -Pattern "ERROR").Count

```



\## 7. Practical Investigation Scenarios



\### Scenario A — Order processing failure



Symptoms:

\- Orders remain in processing.

\- Fulfilment events are delayed.

\- API requests return errors.



Investigation:

1\. Identify the affected order reference.

2\. Find the related correlation ID.

3\. Search order-service logs.

4\. Trace the request into fulfilment-service.

5\. Check downstream responses.

6\. Record the first failure and its timestamp.



\### Scenario B — Database connection timeout



Symptoms:

\- HTTP 500 responses.

\- Increased application latency.

\- Database connection errors.



Investigation:

1\. Identify the first connection error.

2\. Check database availability.

3\. Review connection pool metrics.

4\. Check whether multiple application instances are affected.

5\. Escalate to the database or infrastructure team with evidence.



\### Scenario C — Increased API latency



Symptoms:

\- Slow application responses.

\- Increased request duration.

\- Gateway timeout errors.



Investigation:

1\. Identify the affected endpoint.

2\. Compare response-time metrics.

3\. Search logs for slow requests.

4\. Identify downstream dependencies.

5\. Compare against the last known healthy period.



\## 8. Log Analysis Best Practices



\- Start with the incident timestamp.

\- Use correlation IDs to trace requests across services.

\- Identify the earliest failure, not just the final error.

\- Compare successful and failed transactions.

\- Preserve relevant timestamps and evidence.

\- Avoid exposing passwords, tokens, and customer information.

\- Do not assume that the first visible error is the root cause.



\## 9. Disclaimer



This is an independent educational project. All log records, services, identifiers, and scenarios are fictional.
