\# Kubernetes Troubleshooting Guide



\## 1. Purpose



This guide covers common Kubernetes deployment and application

issues and provides practical investigation commands.



\## 2. Pod Stuck in Pending



Possible causes:

\- Insufficient CPU or memory.

\- Node resource constraints.

\- Persistent volume scheduling problems.



Investigation:



&#x20;   kubectl describe pod <pod-name> -n devops-toolkit



&#x20;   kubectl get events -n devops-toolkit --sort-by=.metadata.creationTimestamp



\## 3. ImagePullBackOff



Possible causes:

\- Incorrect image name or tag.

\- Image unavailable in the cluster.

\- Registry authentication problems.



Investigation:



&#x20;   kubectl describe pod <pod-name> -n devops-toolkit



&#x20;   docker images



For a local kind cluster, load a locally built image using:



&#x20;   kind load docker-image devops-toolkit-api:1.0.0 --name walmartplatform



\## 4. CrashLoopBackOff



Possible causes:

\- Application startup failure.

\- Incorrect environment variables.

\- Application configuration errors.



Investigation:



&#x20;   kubectl logs <pod-name> -n devops-toolkit



&#x20;   kubectl logs <pod-name> -n devops-toolkit --previous



&#x20;   kubectl describe pod <pod-name> -n devops-toolkit



\## 5. Service Not Reachable



Possible causes:

\- Incorrect Service selector.

\- Incorrect target port.

\- Pods are not ready.



Investigation:



&#x20;   kubectl get services -n devops-toolkit



&#x20;   kubectl get endpointslices -n devops-toolkit



&#x20;   kubectl get pods --show-labels -n devops-toolkit



\## 6. Readiness or Liveness Probe Failure



Possible causes:

\- Incorrect health endpoint.

\- Application startup taking too long.

\- Application process unavailable.



Investigation:



&#x20;   kubectl describe pod <pod-name> -n devops-toolkit



&#x20;   kubectl logs <pod-name> -n devops-toolkit



\## 7. HPA Not Scaling



Possible causes:

\- Metrics Server unavailable.

\- Resource requests not configured.

\- CPU utilisation below the scaling target.



Investigation:



&#x20;   kubectl get hpa -n devops-toolkit



&#x20;   kubectl describe hpa devops-toolkit-api -n devops-toolkit



&#x20;   kubectl top pods -n devops-toolkit



\## 8. Deployment Rollout Problems



Investigation:



&#x20;   kubectl rollout status deployment/devops-toolkit-api -n devops-toolkit



&#x20;   kubectl rollout history deployment/devops-toolkit-api -n devops-toolkit



&#x20;   kubectl describe deployment devops-toolkit-api -n devops-toolkit



\## 9. Useful General Commands



&#x20;   kubectl get all -n devops-toolkit



&#x20;   kubectl get events -n devops-toolkit



&#x20;   kubectl describe deployment devops-toolkit-api -n devops-toolkit



&#x20;   kubectl get pods -o wide -n devops-toolkit



\## 10. Troubleshooting Approach



1\. Identify the affected Kubernetes resource.

2\. Check its current status.

3\. Inspect events and resource descriptions.

4\. Review application logs.

5\. Verify configuration and networking.

6\. Apply a controlled corrective action.

7\. Verify application health after recovery.

8\. Document the root cause and resolution.



\## 11. Security Reminder



Never include real passwords, access tokens, or production

credentials in troubleshooting logs or public documentation.

