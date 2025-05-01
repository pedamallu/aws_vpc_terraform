# AWS VPC Terraform Infrastructure

This project implements a **production-ready AWS Virtual Private Cloud (VPC)** architecture using **Terraform**, supporting secure, scalable, and auditable deployments. The design is modular and integrates well with CI/CD pipelines for automated provisioning.

---

## 📐 Architecture Overview

![Architecture Diagram](./Architecture.PDF) <!-- Optional: replace with actual image path or remove -->

- **VPC CIDR**: `10.0.0.0/20`
- **Subnets**:
  - Public Subnet: `10.0.0.0/21`
  - Private Subnet: `10.0.8.0/21`
- **Key Components**:
  - Internet Gateway and NAT Gateway for outbound access
  - Bastion Host for secure access to private instances
  - Separate **Security Groups** for Linux and Windows EC2 instances
  - Network ACLs for subnet-level traffic filtering
  - Route Tables for fine-grained routing control

---

## 🔒 Security Design

- **Bastion Host Pattern**: Deployed in the public subnet to allow SSH/RDP into private EC2 instances.
- **Security Groups**:
  - **Windows SG**: Allows RDP (3389), HTTP (80), HTTPS (443)
  - **Linux SG**: Allows SSH (22), MySQL (3306)
- **NACLs**: Configured to restrict traffic to/from subnets as per security best practices.

---

## ⚙️ Terraform Modules

This infrastructure uses modular Terraform code to promote reuse and scalability:

- `vpc/`: Base VPC, subnets, IGW, route tables
- `compute/`: EC2 instance creation with user-data scripts
- `security/`: Security groups and NACLs
- `bastion/`: Bastion host setup with Elastic IP
- `nat_gateway/`: NAT configuration for private subnet egress

---

## 🚀 CI/CD Integration

Terraform code is structured for use in **CI/CD pipelines**, with support for:

- Remote state backends (e.g., S3 + DynamoDB)
- Workspaces for environment-specific deployments (dev, staging, prod)
- Plan/Apply steps automated through pipeline stages

---

## ✅ Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate IAM permissions
- An AWS account with VPC and EC2 access

---

## 📦 Usage

```bash
# Initialize Terraform
terraform init

# Preview the infrastructure changes
terraform plan -var-file="env/dev.tfvars"

# Apply changes to AWS
terraform apply -var-file="env/dev.tfvars"
