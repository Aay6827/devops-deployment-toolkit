\# Module 05 — Application Support Toolkit



\## Overview



An independent educational project demonstrating practical L2 application support workflows for a fictional e-commerce microservices environment.



The module covers incident management, API troubleshooting, log investigation, SQL-based order analysis, root cause analysis, SLA tracking, and Python automation.



\## Learning Objectives



\- Understand incident severity and escalation procedures.

\- Investigate REST API failures and HTTP response codes.

\- Analyse application logs and correlate events across services.

\- Identify stuck orders and payment inconsistencies using SQL.

\- Document incidents using structured RCA reports.

\- Track acknowledgement, resolution, and SLA compliance.

\- Automate log analysis using Python.

\- Validate automation using pytest.



\## Project Structure



```text

05-application-support/

├── docs/

│   ├── incident-management-guide.md

│   ├── api-troubleshooting-guide.md

│   ├── log-analysis-guide.md

│   ├── root-cause-analysis-template.md

│   └── sla-tracking-guide.md

├── python/

│   └── log\_analyzer.py

├── sample-data/

│   ├── application.log

│   └── orders.csv

├── sql/

│   ├── stuck-order-investigation.sql

│   ├── payment-investigation.sql

│   └── order-reconciliation.sql

└── tests/

&#x20;   └── test\_log\_analyzer.py

```



\## Technologies



\- Python 3.12

\- SQL

\- PostgreSQL-compatible query examples

\- Linux shell commands

\- Windows PowerShell

\- pytest

\- REST API troubleshooting concepts



\## Python Log Analyzer



Run from the repository root:



```powershell

python .\\05-application-support\\python\\log\_analyzer.py

```



The tool reports:

\- Total log records.

\- Severity distribution.

\- Microservice-level log counts.

\- Unique correlation IDs.

\- ERROR and CRITICAL events.



\## Run Automated Tests



From the repository root:



```powershell

Set-Location ".\\05-application-support\\python"

python -m pytest ..\\tests -v

```



Expected result: 6 tests passed.



\## SQL Investigation



The SQL scripts demonstrate read-only investigations into:

\- Orders stuck in processing.

\- Failed and pending payments.

\- Paid orders awaiting fulfilment.

\- Inconsistent order and payment statuses.

\- Order reconciliation summaries.



The queries assume the fictional CSV data has been imported into a database table named `orders`.



\## Training Scenarios



1\. Fulfilment API timeout.

2\. Payment database connection failure.

3\. Inventory database outage.

4\. Orders stuck in processing.

5\. Payment and fulfilment status mismatches.



\## Operational Safety



\- Use fictional sample data only.

\- Do not include employer-confidential information.

\- Never expose credentials, API tokens, or customer records.

\- Use read-only investigation queries unless an approved change procedure exists.

\- Validate service recovery before closing incidents.



\## Disclaimer



This is an independent educational portfolio project. All services, log entries, identifiers, order records, and incident scenarios are fictional. It is not affiliated with or endorsed by any employer or organisation.
