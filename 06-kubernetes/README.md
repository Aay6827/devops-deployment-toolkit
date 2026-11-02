\# Module 06 - Kubernetes Deployment \& Orchestration



\## Overview



This module demonstrates deploying and managing a containerised

application using Kubernetes.



The deployment runs in an isolated namespace named `devops-toolkit`.



\## Technologies



\- Kubernetes

\- kubectl

\- kind

\- Docker

\- YAML

\- Metrics Server

\- Horizontal Pod Autoscaler (HPA)



\## Kubernetes Resources



| Resource | Purpose |

|---|---|

| Namespace | Isolates project resources |

| Deployment | Manages two application replicas |

| Service | Exposes the application internally |

| ConfigMap | Stores non-sensitive configuration |

| Secret | Demonstrates sensitive configuration |

| HPA | Supports CPU-based automatic scaling |



\## Application Configuration



\- Namespace: devops-toolkit

\- Deployment: devops-toolkit-api

\- Container image: devops-toolkit-api:1.0.0

\- Application port: 8000

\- Service port: 80

\- Minimum replicas: 2

\- Maximum replicas: 4

\- CPU scaling target: 60%



\## Deployment



Apply the manifests from the repository root:



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\



\## Verification



&#x20;   kubectl get deployments,pods,services -n devops-toolkit



&#x20;   kubectl get hpa -n devops-toolkit



&#x20;   kubectl get configmaps,secrets -n devops-toolkit



\## Application Testing



Forward the Kubernetes Service to localhost:



&#x20;   kubectl port-forward -n devops-toolkit service/devops-toolkit-api 8088:80



Test the endpoints in another PowerShell window:



&#x20;   Invoke-RestMethod http://127.0.0.1:8088/health



&#x20;   Invoke-RestMethod http://127.0.0.1:8088/ready



\## Security Notes



The Secret contains a dummy demonstration token only.



Do not commit real credentials or production secrets to Git.

Kubernetes Secret data is base64-encoded by default; base64 is

not encryption.



\## Project Scope



This is an independent educational project using fictional

application data. It is not affiliated with or connected to

Reliance Jio or any other employer.

