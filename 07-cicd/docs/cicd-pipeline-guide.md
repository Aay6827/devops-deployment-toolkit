# CI/CD Pipeline Guide

## 1. Introduction

This guide explains the CI/CD pipeline implemented in Module 07 of the DevOps Deployment Toolkit.

The pipeline uses GitHub Actions to automate Kubernetes manifest validation and Python testing.

## 2. Workflow Location

`.github/workflows/kubernetes-validation.yml`

## 3. Pipeline Triggers

The workflow supports three triggers:

- Push to the main branch.
- Pull requests targeting the main branch.
- Manual execution using `workflow_dispatch`.

Path filters ensure the workflow runs when relevant Kubernetes manifests, Module 07 files, or the workflow itself change.

## 4. Execution Environment

The pipeline runs on:

- Operating System: Ubuntu Latest
- Python: 3.12
- YAML Parser: PyYAML
- Testing Framework: pytest

## 5. Pipeline Stages

### Stage 1: Repository Checkout

GitHub Actions checks out the repository using `actions/checkout`.

### Stage 2: Python Setup

The workflow configures Python 3.12 using `actions/setup-python`.

### Stage 3: Dependency Installation

The pipeline installs:

- PyYAML
- pytest

### Stage 4: Kubernetes Manifest Validation

The validation script checks all six Kubernetes manifest files.

It verifies YAML syntax and required Kubernetes object fields.

### Stage 5: Automated Testing

pytest executes five tests covering valid manifests, missing fields, invalid YAML, and empty files.

### Stage 6: Pipeline Result

The workflow reports success when validation and all automated tests pass.

A failed validation or test causes the workflow to fail.

## 6. Security Considerations

- Repository permissions are restricted to `contents: read`.
- No production credentials are required.
- No real Kubernetes secrets are exposed.
- The pipeline does not perform live deployments.

## 7. Limitations

This pipeline performs structural YAML validation.

It does not perform:

- Live Kubernetes API validation.
- Container image publishing.
- Production deployment.
- Automated rollback.

## 8. Future Improvements

Potential enhancements include:

- Docker image security scanning.
- Kubernetes schema validation.
- Container image publishing.
- Deployment automation.
- Environment-specific approvals.
- Automated rollback strategies.

## 9. Learning Outcomes

This pipeline demonstrates practical experience with GitHub Actions, CI/CD automation, Python testing, YAML validation, and Git-based development workflows.
