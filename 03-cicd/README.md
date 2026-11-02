

\# Module 03 — CI/CD Automation



\## Objective



Implement a Continuous Integration pipeline using GitHub Actions to automate application testing and Docker image builds.



\## Architecture



Git Push / Pull Request

&#x20;       |

&#x20;       v

GitHub Actions Workflow

&#x20;       |

&#x20;       v

Python 3.12 Setup

&#x20;       |

&#x20;       v

Install Dependencies

&#x20;       |

&#x20;       v

Run Pytest Automated Tests

&#x20;       |

&#x20;       v

Build Docker Image

&#x20;       |

&#x20;       v

Pipeline Success / Failure



\## Technologies



\- Git and GitHub

\- GitHub Actions

\- Python 3.12

\- FastAPI

\- Pytest

\- Docker



\## Pipeline Workflow



The workflow is defined in:



.github/workflows/ci.yml



It performs the following operations:



1\. Checks out the repository.

2\. Configures Python 3.12.

3\. Installs application and testing dependencies.

4\. Runs automated API endpoint tests.

5\. Builds the Docker image.



\## Automated Tests



The pipeline tests three FastAPI endpoints:



\- GET /

\- GET /health

\- GET /ready



Tests are stored in:



02-docker/tests/test\_app.py



\## Trigger Conditions



The workflow runs when:



\- Changes to the Docker module are pushed to main.

\- A pull request targeting main changes the Docker module.

\- The workflow is manually started from GitHub Actions.



\## How to View Pipeline Results



1\. Open the GitHub repository.

2\. Select the Actions tab.

3\. Open DevOps Toolkit CI.

4\. Select a workflow run.

5\. Review individual job steps and logs.



\## Expected Outcome



A successful pipeline confirms that:



\- Dependencies install correctly.

\- Automated API tests pass.

\- The Docker image builds successfully.



\## Scope



This is an educational portfolio implementation. It does not deploy to production or publish the Docker image to a registry.



