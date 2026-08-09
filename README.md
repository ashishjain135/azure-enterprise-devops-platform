# Azure Enterprise DevOps Platform

Enterprise-grade Azure infrastructure platform built using **Terraform** and **GitHub Actions**, following modular Infrastructure as Code (IaC), Landing Zone, security, networking, and CI/CD best practices.

The project demonstrates how Azure infrastructure can be provisioned, validated, secured, and deployed automatically through a GitHub-based DevOps workflow.

---

## 🚀 Project Overview

This project implements a modular Azure infrastructure architecture using Terraform.

The infrastructure is organized into reusable Terraform modules and deployed through **GitHub Actions CI/CD pipelines**.

### Key objectives

* Build a modular Azure infrastructure architecture
* Implement Infrastructure as Code using Terraform
* Follow Azure Landing Zone principles
* Automate Terraform validation and deployment
* Implement GitHub Actions CI/CD
* Separate infrastructure into reusable modules
* Follow enterprise naming and tagging standards
* Implement secure and controlled infrastructure deployment
* Demonstrate feature-branch → pull-request → review → merge workflow

---

## 🏗️ Architecture

```text
                         GitHub Repository
                                │
                                │
                       Feature Branch
                                │
                                ▼
                         Pull Request
                                │
                         Code Review
                                │
                                ▼
                            main
                                │
                                ▼
                       GitHub Actions CI/CD
                                │
                 ┌──────────────┴──────────────┐
                 │                             │
              CI Pipeline                 CD Pipeline
                 │                             │
        ┌────────┴─────────┐           ┌───────┴────────┐
        │                  │           │                │
   Terraform fmt      Terraform       Plan           Apply
                       validate          │                │
        │                  │            ▼                ▼
        └──────────┬───────┘       Approval         Azure
                   │
                   ▼
              Security Scan
                   │
                   ▼
              Terraform Plan
```

---

## ☁️ Azure Infrastructure

The current infrastructure includes:

* Resource Groups
* Virtual Network
* Subnets
* Public IP
* Key Vault
* Virtual Machines
* Azure Bastion
* Application Gateway
* Azure Load Balancer

### Application traffic flow

```text
                     Internet
                         │
                         ▼
                Application Gateway
                         │
              ┌──────────┴──────────┐
              │                     │
         Frontend VM            Frontend VM
              │                     │
              └──────────┬──────────┘
                         │
                         ▼
                   Load Balancer
                         │
              ┌──────────┴──────────┐
              │                     │
         Backend VM             Backend VM
              │                     │
              └──────────┬──────────┘
                         │
                         ▼
                     Key Vault
```

---

## 📦 Terraform Modules

The infrastructure is divided into reusable modules.

```text
modules/
│
├── azurerm_resource_group/
├── azurerm_virtual_network/
├── azurerm_subnet/
├── azurerm_public_ip/
├── azurerm_key_vault/
├── azurerm_virtual_machine/
├── azurerm_bastion/
├── azurerm_application_gateway/
└── azurerm_load_balancer/
```

Each module is responsible for provisioning a specific Azure resource or infrastructure component.

This modular approach provides:

* Reusability
* Maintainability
* Consistency
* Easier testing
* Environment-specific configuration
* Cleaner Terraform code

---

## 📁 Repository Structure

```text
azure-enterprise-devops-platform/
│
├── .github/
│   └── workflows/
│       ├── terraform-ci.yml
│       └── terraform-cd.yml
│
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│   │
│   ├── qa/
│   └── prod/
│
├── modules/
│   ├── azurerm_resource_group/
│   ├── azurerm_virtual_network/
│   ├── azurerm_subnet/
│   ├── azurerm_public_ip/
│   ├── azurerm_key_vault/
│   ├── azurerm_virtual_machine/
│   ├── azurerm_bastion/
│   ├── azurerm_application_gateway/
│   └── azurerm_load_balancer/
│
├── docs/
│
├── scripts/
│
├── .gitignore
├── README.md
└── LICENSE
```

> The exact directory structure may evolve as additional Landing Zone and DevOps components are added.

---

# 🔄 CI/CD Pipeline

GitHub Actions is used to automate Terraform infrastructure validation and deployment.

## CI Pipeline

The CI pipeline runs when infrastructure code is pushed or a Pull Request is created.

Typical validation stages:

```text
Code Push / Pull Request
          │
          ▼
    Checkout Code
          │
          ▼
    Terraform Setup
          │
          ▼
    Terraform Format
          │
          ▼
    Terraform Validate
          │
          ▼
      TFLint
          │
          ▼
   Security Scanning
          │
          ▼
    Terraform Plan
```

### CI responsibilities

* Validate Terraform syntax
* Check Terraform formatting
* Detect configuration issues
* Run linting
* Perform infrastructure security checks
* Generate Terraform plan
* Prevent invalid infrastructure from being merged

---

## CD Pipeline

After the code is reviewed and merged into the protected `main` branch, the deployment pipeline can execute.

```text
Pull Request
     │
     ▼
Code Review
     │
     ▼
Merge to main
     │
     ▼
GitHub Actions
     │
     ▼
Terraform Init
     │
     ▼
Terraform Plan
     │
     ▼
Approval
     │
     ▼
Terraform Apply
     │
     ▼
Azure Infrastructure
```

This ensures that infrastructure changes are deployed through a controlled and auditable process.

---

# 🌿 Git Branching Strategy

The project follows a feature-branch workflow.

```text
main
 │
 ├── feature/network
 │
 ├── feature/virtual-machine
 │
 ├── feature/security
 │
 └── feature/monitoring
```

Developers create changes in feature branches rather than directly modifying `main`.

### Workflow

```text
Feature Branch
      │
      ▼
Push Code
      │
      ▼
Pull Request
      │
      ▼
CI Pipeline
      │
      ▼
Code Review
      │
      ▼
Approval
      │
      ▼
Merge to main
      │
      ▼
CD Pipeline
      │
      ▼
Azure Deployment
```

The `main` branch should be protected to prevent direct pushes and enforce Pull Request-based deployments.

---

# 🔐 Security

Security is an important part of the platform.

Current and planned security practices include:

* Azure Key Vault
* Secure secret management
* GitHub repository secrets / variables
* Role-Based Access Control (RBAC)
* Managed Identity
* Network Security Groups
* Private Endpoints
* Azure Policy
* Infrastructure security scanning
* Protected GitHub branches
* Pull Request approvals

Sensitive credentials and secrets should **never be committed to the repository**.

---

# 🗄️ Terraform State Management

Terraform state should be stored remotely using an Azure Storage Account.

Example architecture:

```text
Terraform
    │
    ▼
Azure Storage Account
    │
    ▼
Blob Container
    │
    ▼
terraform.tfstate
```

Remote state provides:

* Centralized state management
* Team collaboration
* State locking
* Reduced risk of local state loss
* Controlled infrastructure changes

---

# 🧩 Azure Landing Zone Approach

The project follows the principles of an Azure Landing Zone architecture.

The long-term target architecture separates:

```text
Azure Tenant
     │
     ▼
Management Groups
     │
 ┌───┴────────────────────┐
 │                        │
Platform              Landing Zones
 │                        │
 ├── Identity             ├── Production
 ├── Connectivity         ├── Non-Production
 └── Management           └── Sandbox
```

The platform layer provides shared services and governance, while workload subscriptions/environments host application infrastructure.

---

# 🌐 Networking

The workload infrastructure uses a segmented network architecture.

Example:

```text
Virtual Network
│
├── Application Gateway Subnet
│
├── Frontend Subnet
│
├── Backend Subnet
│
└── Azure Bastion Subnet
```

The architecture can be extended with:

* Network Security Groups
* Route Tables
* NAT Gateway
* Azure Firewall
* Private DNS
* Private Endpoints
* Hub-Spoke networking
* VPN Gateway
* ExpressRoute

---

# 📊 Monitoring & Governance

Planned enterprise capabilities include:

* Azure Monitor
* Log Analytics Workspace
* Diagnostic Settings
* Alerts
* Action Groups
* Azure Policy
* Microsoft Defender for Cloud
* Resource Locks
* Cost Management
* Budgets
* Mandatory resource tags

---

# 🛠️ Technologies Used

| Technology          | Purpose                     |
| ------------------- | --------------------------- |
| Azure               | Cloud Infrastructure        |
| Terraform           | Infrastructure as Code      |
| GitHub              | Source Code Management      |
| GitHub Actions      | CI/CD Automation            |
| Azure Key Vault     | Secret Management           |
| Application Gateway | Application Traffic Routing |
| Load Balancer       | Backend Load Distribution   |
| Azure Bastion       | Secure VM Access            |
| Virtual Machines    | Compute                     |
| Virtual Network     | Network Infrastructure      |
| Azure Storage       | Terraform Remote State      |

---

# ⚙️ Prerequisites

Before running the project locally, install:

* Azure CLI
* Terraform
* Git
* GitHub account
* Azure subscription

Verify installations:

```bash
az --version
terraform --version
git --version
```

Authenticate with Azure:

```bash
az login
```

---

# 🚀 Local Deployment

Clone the repository:

```bash
git clone <repository-url>
cd azure-enterprise-devops-platform
```

Navigate to the required environment:

```bash
cd environments/dev
```

Initialize Terraform:

```bash
terraform init
```

Format Terraform files:

```bash
terraform fmt -recursive
```

Validate configuration:

```bash
terraform validate
```

Create execution plan:

```bash
terraform plan
```

Apply infrastructure:

```bash
terraform apply
```

---

# 🔁 GitHub Actions Deployment

Infrastructure deployment through GitHub Actions follows:

```text
Developer
   │
   ▼
Feature Branch
   │
   ▼
Pull Request
   │
   ▼
CI Validation
   │
   ├── Terraform Format
   ├── Terraform Validate
   ├── Lint
   ├── Security Scan
   └── Terraform Plan
   │
   ▼
Code Review
   │
   ▼
Merge
   │
   ▼
main
   │
   ▼
CD Pipeline
   │
   ▼
Terraform Apply
   │
   ▼
Azure
```

For production environments, deployment should use an approval gate before `terraform apply`.

---

# 🎯 Project Goals

The main goals of this project are to demonstrate practical knowledge of:

* Azure Cloud
* Azure Landing Zone architecture
* Terraform
* Infrastructure as Code
* Terraform Modules
* Remote State Management
* Azure Networking
* Azure Security
* Git
* GitHub
* GitHub Actions
* CI/CD
* Branch Protection
* Pull Requests
* Infrastructure Security
* Enterprise DevOps practices

---

# 🔮 Future Enhancements

The platform will be expanded with additional enterprise capabilities:

* [ ] Management Groups
* [ ] Azure Policy
* [ ] RBAC
* [ ] Hub-Spoke Network
* [ ] Azure Firewall
* [ ] NSG
* [ ] Route Tables
* [ ] NAT Gateway
* [ ] Private Endpoints
* [ ] Private DNS Zones
* [ ] Log Analytics
* [ ] Azure Monitor
* [ ] Microsoft Defender for Cloud
* [ ] Azure Storage Remote Backend
* [ ] State Locking
* [ ] Managed Identity / OIDC
* [ ] VM Scale Sets
* [ ] Backup
* [ ] Disaster Recovery
* [ ] Cost Management
* [ ] Azure Budgets
* [ ] Multi-environment deployment
* [ ] Production approval gates
* [ ] Terraform security scanning
* [ ] Automated documentation

---

# 👨‍💻 DevOps Workflow

```text
                    ┌─────────────────┐
                    │    Developer    │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Feature Branch  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Pull Request    │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ GitHub Actions  │
                    │      CI         │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Code Review     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Merge to main  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ GitHub Actions  │
                    │      CD         │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Terraform Plan │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    Approval     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Terraform Apply │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Azure Platform  │
                    └─────────────────┘
```

---

## 📌 Disclaimer

This project is created for learning, demonstration, and portfolio purposes. Infrastructure configurations should be reviewed and hardened according to organizational security, compliance, networking, and cost requirements before being used in production.
