```markdown
# Azure Terraform Infrastructure

A modular Infrastructure as Code (IaC) project deploying core infrastructure to Microsoft Azure using Terraform and DevSecOps best practices.

## Overview

This repository automates the provisioning of secure Azure network and compute resources using reusable Terraform modules and remote state management.

### Architecture

The infrastructure configuration is structured into dedicated modules inside the `terraform/` directory:

* **Network**: Virtual network (VNet), subnets, and Network Security Groups (NSGs).
* **Compute**: Virtual machines and associated network interfaces.
* **Bastion**: Secure management access without public IP exposure on workload VMs.

## Security & State Management

The Terraform state (`terraform.tfstate`) is secured in Azure Blob Storage using a dedicated resource group with the following hardening measures:

* **Identity-based Access**: Shared access keys are disabled; access is strictly enforced via Microsoft Entra ID (RBAC) using `use_azuread_auth = true`.
* **State Integrity**: Blob versioning and soft delete (14-day retention) protect against corruption and accidental deletion.
* **Management Locks**: An Azure `CanNotDelete` resource lock is applied to prevent accidental removal of the state storage account.

## Prerequisites

* [Terraform](https://www.terraform.io/downloads.html) (>= 1.9.0)
* [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
* Azure account with `Storage Blob Data Contributor` and `Contributor` permissions.

## Local Deployment

1. Authenticate with Azure:
   ```bash
   az login

```

2. Navigate to the Terraform configuration directory:
```bash
cd terraform

```


3. Initialize the backend and providers:
```bash
terraform init

```


4. Validate the configuration and check the execution plan:
```bash
terraform validate
terraform plan

```


5. Deploy the resources:
```bash
terraform apply

```

## CI/CD Pipeline

Automated deployment is configured via GitHub Actions:

* **Pull Requests**: Executes `terraform fmt -check`, `terraform validate`, and `terraform plan`.
* **Main Branch**: Runs `terraform apply` automatically upon merge.
* **Authentication**: Uses OpenID Connect (OIDC) via Azure Workload Identity Federation to eliminate the need for persistent secrets or passwords.

```