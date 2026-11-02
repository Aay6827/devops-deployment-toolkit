

\# CI/CD Troubleshooting Guide



\## 1. GitHub Actions Workflow Does Not Start



\*\*Possible causes:\*\*

\- Changes were made outside the configured paths.

\- The workflow file is not in `.github/workflows/`.

\- The push was made to a different branch.



\*\*Resolution:\*\*

\- Verify the target branch is `main`.

\- Check the workflow file location.

\- Review the configured path filters.

\- Use the Actions tab to check workflow runs.



\## 2. Dependency Installation Fails



\*\*Possible causes:\*\*

\- Incorrect package versions.

\- Invalid requirements file.

\- Package installation or network failure.



\*\*Resolution:\*\*

\- Review `requirements-dev.txt`.

\- Check package versions.

\- Re-run the workflow and inspect installation logs.



\## 3. Automated Tests Fail



\*\*Possible causes:\*\*

\- Application code changes.

\- Incorrect endpoint responses.

\- Missing dependencies.

\- Incorrect working directory.



\*\*Resolution:\*\*

\- Run `python -m pytest -v` locally from `02-docker`.

\- Review the failing assertion.

\- Verify the application imports and endpoint responses.



\## 4. Docker Image Build Fails



\*\*Possible causes:\*\*

\- Invalid Dockerfile instructions.

\- Missing application files.

\- Incorrect build context.

\- Dependency installation failure.



\*\*Resolution:\*\*

\- Run `docker build -t devops-deployment-toolkit:ci .` from `02-docker`.

\- Review Docker build logs.

\- Check Dockerfile and requirements.txt.



\## 5. GitHub Actions Permission Issues



\*\*Possible causes:\*\*

\- Workflow permissions are insufficient for a requested operation.



\*\*Resolution:\*\*

\- Review the workflow permissions.

\- Grant only the minimum permissions required.

\- Check repository Actions settings.



\## Operational Reminder



Always investigate failed pipeline steps before retrying.



Do not treat a successful Docker image build as proof of a production deployment. This project builds and tests an image but does not deploy it.



