\# Application Support — SLA Tracking Guide



\## 1. What Is an SLA?



A Service Level Agreement (SLA) defines agreed service expectations between a service provider and its customer or business.



Application Support teams commonly track:

\- Incident acknowledgement time.

\- Incident response time.

\- Resolution time.

\- Service availability.

\- Escalation compliance.



\## 2. Incident Priority and Response Targets



The following targets are illustrative training values, not industry-wide standards or contractual commitments.



| Priority | Example | Acknowledgement Target | Resolution Target |

|---|---|---:|---:|

| P1 — Critical | Checkout or payment service unavailable | 15 minutes | 4 hours |

| P2 — High | Major fulfilment disruption | 30 minutes | 8 hours |

| P3 — Medium | Limited functionality affected | 4 hours | 2 business days |

| P4 — Low | Minor issue or service request | 1 business day | 5 business days |



Always follow the actual SLA agreed by the organisation.



\## 3. Important SLA Metrics



\### Mean Time to Acknowledge (MTTA)



Average time between incident creation and acknowledgement.



MTTA = Total acknowledgement time / Number of incidents



\### Mean Time to Resolve (MTTR)



For this project, MTTR means average time from incident creation to resolution.



MTTR = Total resolution time / Number of resolved incidents



Organisations may define MTTR differently, so document the chosen definition.



\### SLA Compliance



SLA compliance percentage:



SLA Compliance = (Incidents resolved within SLA / Total eligible resolved incidents) × 100



\## 4. Example Incident Tracker



| Incident ID | Priority | Created | Acknowledged | Resolved | SLA Met |

|---|---|---|---|---|---|

| INC-1001 | P1 | 09:00 | 09:10 | 11:30 | Yes |

| INC-1002 | P2 | 10:00 | 10:45 | 19:00 | No |

| INC-1003 | P3 | 11:00 | 12:00 | 14:00 | Yes |

| INC-1004 | P4 | 12:00 | 13:00 | 15:00 | Yes |



These are fictional training records.



\## 5. Escalation Matrix



| Team | Escalation Reason |

|---|---|

| Application Support L1 | Initial triage and basic checks |

| Application Support L2 | Log analysis, API investigation, service checks |

| Development Team | Code defects and application failures |

| Database Team | Query performance and database availability |

| Infrastructure / Cloud Team | Compute, networking, containers, infrastructure |

| Third-Party Provider | External API or vendor service failures |



\## 6. SLA Monitoring Workflow



1\. Record incident creation time.

2\. Assign priority based on business impact and urgency.

3\. Acknowledge the incident.

4\. Start investigation and record evidence.

5\. Monitor the SLA deadline.

6\. Escalate before a breach when required.

7\. Record resolution time.

8\. Validate recovery.

9\. Close the incident with a clear summary.



\## 7. Operational Best Practices



\- Use consistent timestamps and time zones.

\- Distinguish acknowledgement from resolution.

\- Do not mark an incident resolved before validation.

\- Record SLA pauses only when the applicable agreement permits them.

\- Track breached and at-risk incidents.

\- Review recurring incidents and trends.

\- Keep escalation evidence factual and timestamped.



\## 8. Disclaimer



All incident IDs, targets, and examples in this guide are fictional. Real SLA targets must come from the relevant service agreement and organisational policy.
