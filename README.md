# DevOps Deployment Toolkit

A practical, hands-on portfolio project demonstrating DevOps automation, application deployment, Kubernetes orchestration, monitoring, and application support practices.

[![DevOps Toolkit CI](https://github.com/Aay6827/devops-deployment-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/Aay6827/devops-deployment-toolkit/actions/workflows/ci.yml)

[![Kubernetes Manifest Validation](https://github.com/Aay6827/devops-deployment-toolkit/actions/workflows/kubernetes-validation.yml/badge.svg)](https://github.com/Aay6827/devops-deployment-toolkit/actions/workflows/kubernetes-validation.yml)

**Repository:** [github.com/Aay6827/devops-deployment-toolkit](https://github.com/Aay6827/devops-deployment-toolkit)

---

## 1. Project Overview

The DevOps Deployment Toolkit is an independent, practical learning and portfolio project focused on building and documenting real-world DevOps and application operations capabilities.

It brings together Linux administration, containerisation, CI/CD automation, monitoring, application support, Kubernetes deployment, and infrastructure validation.

The project is designed around operational scenarios relevant to modern application environments, including e-commerce, retail platforms, and supply chain technology.

### Project Objectives

- Automate application testing and deployment-related workflows.

- Containerise applications using Docker.

- Implement monitoring and observability practices.

- Develop application troubleshooting and incident investigation skills.

- Deploy and manage applications using Kubernetes.

- Integrate automated validation into GitHub Actions.

- Document repeatable operational procedures and troubleshooting practices.

## 2. Technology Stack

| Category | Technologies |

|---|---|

| Operating Systems | Linux, Windows |

| Scripting | Python, Bash |

| Programming | Python, SQL |

| Version Control | Git, GitHub |

| Containers | Docker, Docker Compose |

| CI/CD | GitHub Actions |

| Orchestration | Kubernetes, kubectl, kind |

| Monitoring | Prometheus, Grafana |

| Application Framework | FastAPI |

| Testing | pytest |

| Data and Configuration | YAML, JSON, SQL |

## 3. Project Modules

The repository is organised into independent modules covering different areas of DevOps and application operations.

| Module | Area | Key Implementation |

|---|---|---|

| [01 - Linux](01-linux/) | Linux Administration | Troubleshooting handbook and Bash health-check automation |

| [02 - Docker](02-docker/) | Containerisation | FastAPI application, Dockerfile, Docker Compose, and application tests |

| [03 - CI/CD](03-cicd/) | Pipeline Automation | CI/CD fundamentals and automation exercises |

| [04 - Monitoring](04-monitoring/) | Observability | Prometheus and Grafana monitoring setup |

| [05 - Application Support](05-application-support/) | Application Operations | Log analysis, incident investigation, RCA documentation, and SQL examples |

| [06 - Kubernetes](06-kubernetes/) | Container Orchestration | Deployments, Services, ConfigMaps, Secrets, and Horizontal Pod Autoscaling |

| [07 - CI/CD Pipeline Automation](07-cicd/) | Automated Validation | GitHub Actions workflow, Kubernetes manifest validation, and pytest automation |

Each module includes relevant implementation files and documentation.

## 4. CI/CD Automation

The repository uses GitHub Actions to automate testing and validation.

### Workflow 1: DevOps Toolkit CI

[View DevOps Toolkit CI](.github/workflows/ci.yml)

The workflow includes:

- Python environment setup.

- Dependency installation.

- Automated application testing.

- Application Support test execution.

- Docker image build validation.

### Workflow 2: Kubernetes Manifest Validation

[View Kubernetes Manifest Validation](.github/workflows/kubernetes-validation.yml)

The workflow includes:

1. Repository checkout.

2. Python 3.12 environment setup.

3. PyYAML and pytest installation.

4. Kubernetes manifest structural validation.

5. Automated Python test execution.

**Latest Module 07 local validation results:**

- Kubernetes manifests validated: 6 passed.

- Automated Python tests: 5 passed.

- Total local checks: 11 passed.

The GitHub Actions workflow for Kubernetes Manifest Validation has also completed successfully.

## 5. Kubernetes Implementation

The Kubernetes module demonstrates application deployment and orchestration using a local Kubernetes environment.

Implemented resources include:

- Namespace

- Deployment

- Service

- ConfigMap

- Secret

- Horizontal Pod Autoscaler (HPA)

The deployment configuration includes multiple replicas, resource requests and limits, and application health probes.

The project uses a local kind cluster for hands-on Kubernetes learning and validation.

## 6. Application Support and Operations

The toolkit also focuses on operational practices that help maintain application reliability.

Key areas include:

- Application log analysis.

- Incident investigation.

- API troubleshooting.

- Root Cause Analysis (RCA).

- SQL-based investigation examples.

- Operational documentation.

- Automated health checks.

- Repeatable troubleshooting procedures.

These capabilities connect DevOps engineering with application support and production operations.

## 7. Repository Structure

&#x20;   devops-deployment-toolkit/

&#x20;   |

&#x20;   |-- .github/

&#x20;   |   |-- workflows/

&#x20;   |       |-- ci.yml

&#x20;   |       |-- kubernetes-validation.yml

&#x20;   |

&#x20;   |-- 01-linux/

&#x20;   |-- 02-docker/

&#x20;   |-- 03-cicd/

&#x20;   |-- 04-monitoring/

&#x20;   |-- 05-application-support/

&#x20;   |-- 06-kubernetes/

&#x20;   |-- 07-cicd/

&#x20;   |

&#x20;   |-- .env.example

&#x20;   |-- .gitattributes

&#x20;   |-- .gitignore

&#x20;   |-- README.md

## 8. Running Local Validations

Install the dependencies required for Module 07:

&#x20;   python -m pip install PyYAML pytest

Run Kubernetes manifest validation:

&#x20;   python 07-cicd/scripts/validate_manifests.py

Run Module 07 automated tests:

&#x20;   python -m pytest 07-cicd/tests -v

Run the Application Support tests:

&#x20;   python -m pytest 05-application-support/python/tests -v

Run the Docker application tests using the instructions in the `02-docker/` module.

## 9. Skills Demonstrated

This project demonstrates practical learning and implementation across:

- Linux administration and troubleshooting.

- Python and Bash scripting.

- Docker containerisation.

- CI/CD pipeline automation.

- Git and GitHub workflows.

- Prometheus and Grafana monitoring.

- Kubernetes deployment and orchestration.

- YAML configuration and validation.

- Automated testing with pytest.

- Application support and incident investigation.

- Technical documentation and operational procedures.

## 10. Future Enhancements

Potential future improvements include:

- Kubernetes schema validation.

- Container image vulnerability scanning.

- Container registry integration.

- Automated deployment pipelines.

- Environment-specific deployment approvals.

- Infrastructure provisioning using Terraform.

- Cloud deployment integration.

- Advanced observability and alerting.

These are planned enhancements and are not represented as completed implementations.

## 11. Project Disclaimer

This repository is an independent educational and portfolio project developed for learning, experimentation, and professional skill demonstration.

All sample scenarios and data are fictional or demonstrative. No confidential employer information, production credentials, customer data, or proprietary company scripts are intended to be included.

This project is not affiliated with, endorsed by, or officially associated with any employer, retailer, cloud provider, or technology company.

---

**Maintained by:** [Aayush Tiwari](https://github.com/Aay6827)

**Focus Areas:** DevOps | Cloud Operations | Application Support | Kubernetes | CI/CD | E-commerce and Supply Chain Technology
