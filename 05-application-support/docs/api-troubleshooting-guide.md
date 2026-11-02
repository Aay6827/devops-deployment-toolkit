\# Application Support — API Troubleshooting Guide



\## 1. Overview



This guide provides a systematic approach to investigating REST API failures in an e-commerce microservices environment.



The examples use fictional endpoints and sample responses.



\## 2. Common HTTP Status Codes



| Status | Meaning | Typical Investigation |

|---|---|---|

| 200 | OK | Request completed successfully |

| 201 | Created | Resource created successfully |

| 204 | No Content | Request succeeded without a response body |

| 400 | Bad Request | Validate request parameters and payload |

| 401 | Unauthorized | Check authentication and token validity |

| 403 | Forbidden | Check permissions and access policies |

| 404 | Not Found | Validate endpoint and resource identifier |

| 408 | Request Timeout | Investigate request processing delays |

| 409 | Conflict | Check duplicate requests or resource state |

| 429 | Too Many Requests | Investigate rate limits and retry policy |

| 500 | Internal Server Error | Review application logs and exceptions |

| 502 | Bad Gateway | Check upstream service health |

| 503 | Service Unavailable | Check service availability and dependencies |

| 504 | Gateway Timeout | Investigate upstream response latency |



\## 3. Standard API Investigation Workflow



1\. Confirm the affected endpoint and HTTP method.

2\. Record the request timestamp and timezone.

3\. Capture the HTTP status code and response time.

4\. Record the correlation or request ID.

5\. Validate the request payload and headers.

6\. Check authentication and authorization where applicable.

7\. Review application and gateway logs.

8\. Check downstream service availability.

9\. Compare current behaviour with the last known healthy state.

10\. Document findings and escalate when required.



\## 4. Example API Endpoints



| Service | Example Endpoint | Purpose |

|---|---|---|

| Order Service | GET /api/orders/{id} | Retrieve order details |

| Fulfilment Service | GET /api/fulfilment/{id} | Check fulfilment status |

| Inventory Service | GET /api/inventory/{sku} | Retrieve stock information |

| Payment Service | GET /api/payments/{id} | Check payment status |

| Returns Service | GET /api/returns/{id} | Check return status |



These are illustrative endpoints, not live services.



\## 5. PowerShell API Checks



\### Check an HTTP endpoint



```powershell

Invoke-WebRequest -Uri "http://localhost:8000/health" -Method Get

```



\### Retrieve a JSON response



```powershell

Invoke-RestMethod -Uri "http://localhost:8000/" -Method Get

```



\### Measure API response time



```powershell

Measure-Command {

&#x20;   Invoke-RestMethod -Uri "http://localhost:8000/health"

}

```



\### Check API availability



```powershell

Test-NetConnection localhost -Port 8000

```



Use approved test endpoints and non-production environments for these examples.



\## 6. Common API Failure Scenarios



\### Scenario A — HTTP 500



Possible causes:

\- Unhandled application exception.

\- Database connectivity failure.

\- Invalid application configuration.

\- Downstream dependency failure.



Actions:

\- Capture timestamp and correlation ID.

\- Review application logs.

\- Check dependency health.

\- Escalate with the exception details and business impact.



\### Scenario B — HTTP 504



Possible causes:

\- Slow downstream service.

\- Database query latency.

\- Network delay.

\- Gateway timeout configuration.



Actions:

\- Measure response latency.

\- Check upstream service health.

\- Review timeout and dependency metrics.

\- Identify whether the issue is isolated or widespread.



\### Scenario C — HTTP 429



Possible causes:

\- API rate limits exceeded.

\- Excessive request volume.

\- Retry loops or duplicate requests.



Actions:

\- Inspect response headers, including Retry-After when provided.

\- Check request volume and client behaviour.

\- Apply the documented retry policy.

\- Avoid uncontrolled retry loops.



\## 7. Troubleshooting Evidence Template



Record:



\- Incident ID:

\- Service:

\- Endpoint:

\- HTTP method:

\- Status code:

\- Timestamp and timezone:

\- Response time:

\- Correlation ID:

\- Error message:

\- Business impact:

\- Investigation performed:

\- Current status:

\- Escalation team:



Do not include passwords, access tokens, or sensitive customer data.



\## 8. Operational Safety



\- Never test production APIs without authorization.

\- Avoid exposing authentication tokens.

\- Do not repeatedly retry payment or order-creation requests without checking transaction state.

\- Respect API rate limits.

\- Follow approved recovery and escalation procedures.



\## 9. Disclaimer



This is an independent educational resource. All endpoints, services, and scenarios are fictional and intended for application-support learning.
