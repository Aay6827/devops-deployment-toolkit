\# Kubernetes Deployment Guide



\## 1. Purpose



This guide explains how to deploy the DevOps Toolkit API

to a local Kubernetes cluster using kind.



\## 2. Prerequisites



\- Docker Desktop

\- Kubernetes CLI (kubectl)

\- kind

\- A running kind cluster

\- The application image loaded into the kind cluster



\## 3. Create the Namespace



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\namespace.yaml



\## 4. Apply Configuration



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\configmap.yaml



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\secret.yaml



\## 5. Deploy the Application



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\deployment.yaml



\## 6. Create the Service



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\service.yaml



\## 7. Configure Autoscaling



&#x20;   kubectl apply -f .\\06-kubernetes\\manifests\\hpa.yaml



\## 8. Verify Resources



&#x20;   kubectl get all -n devops-toolkit



&#x20;   kubectl get hpa -n devops-toolkit



&#x20;   kubectl get configmaps,secrets -n devops-toolkit



\## 9. Check Application Health



&#x20;   kubectl port-forward -n devops-toolkit service/devops-toolkit-api 8088:80



In another PowerShell window:



&#x20;   Invoke-RestMethod http://127.0.0.1:8088/health



&#x20;   Invoke-RestMethod http://127.0.0.1:8088/ready



\## 10. Monitor Resource Usage



&#x20;   kubectl top pods -n devops-toolkit



&#x20;   kubectl top nodes



\## 11. Clean Up



To remove only this module's resources:



&#x20;   kubectl delete namespace devops-toolkit



Warning: This deletes all resources inside the devops-toolkit

namespace. Do not run it while you want to keep the deployment.



\## 12. Operational Notes



\- The Deployment maintains the desired number of replicas.

\- The Service provides stable internal access to the Pods.

\- Readiness and liveness probes monitor application health.

\- The HPA evaluates CPU utilisation and adjusts replica count

&#x20; within the configured minimum and maximum.

\- ConfigMaps hold non-sensitive configuration.

\- Secrets should contain sensitive values and must be protected.

