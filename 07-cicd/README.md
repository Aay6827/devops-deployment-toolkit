# Module 07 - CI/CD Pipeline Automation

## 1. Overview

This module demonstrates Continuous Integration and Continuous Delivery (CI/CD) using GitHub Actions and Python.

The objective is to automate Kubernetes manifest validation and automated testing before changes are merged into the main branch.

## 2. Technologies

- GitHub Actions
- Python 3.12
- PyYAML
- pytest
- Kubernetes YAML manifests
- Git and GitHub

## 3. Project Structure

07-cicd/
- README.md
- scripts/
  - validate_manifests.py
- tests/
  - test_validate_manifests.py
- docs/

GitHub Actions workflow:

.github/workflows/kubernetes-validation.yml

## 4. Pipeline Workflow

1. Developer pushes changes or opens a pull request.
2. GitHub Actions checks out the repository.
3. Python 3.12 is configured.
4. PyYAML and pytest dependencies are installed.
5. Kubernetes manifests are validated.
6. Automated Python tests are executed.
7. The pipeline reports success or failure.

## 5. Kubernetes Manifest Validation

The validation script checks:

- Required manifest files exist.
- YAML syntax is valid.
- Each document contains apiVersion.
- Each document contains kind.
- Each document contains metadata.name.

## 6. Automated Testing

Five automated tests cover:

- Valid Kubernetes manifest.
- Missing metadata.name.
- Missing required fields.
- Invalid YAML syntax.
- Empty YAML files.

## 7. Local Execution

Install dependencies:

    python -m pip install PyYAML pytest

Run manifest validation:

    python 07-cicd/scripts/validate_manifests.py

Run automated tests:

    python -m pytest 07-cicd/tests -v

## 8. Local Validation Results

- Kubernetes manifests: 6 passed.
- Automated tests: 5 passed.

## 9. Important Notes

This module performs structural YAML validation. It does not replace Kubernetes API-server validation or full Kubernetes schema validation.

The pipeline does not deploy applications to a live cluster or publish container images to an external registry.

## 10. Learning Outcomes

- Understanding CI/CD automation.
- Building GitHub Actions workflows.
- Automating Kubernetes manifest checks.
- Writing automated Python tests.
- Integrating validation into a Git-based workflow.
- Identifying pipeline failures before deployment.