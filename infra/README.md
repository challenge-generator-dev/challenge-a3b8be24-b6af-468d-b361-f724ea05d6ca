# Terraform Infrastructure Module

## Structure
```
.
├── backend.tf              # Backend configuration (S3/DynamoDB)
├── versions.tf             # Terraform and provider versions
├── providers.tf            # AWS provider configuration
├── modules/
│   ├── network/            # VPC, subnets, security groups
│   ├── compute/            # EC2, ECS, Lambda
│   ├── database/           # RDS, DynamoDB
│   └── storage/            # S3, EFS
└── environments/
    ├── dev/                # Development environment
    │   ├── main.tf         # Root module
    │   ├── variables.tf    # Input variables
    │   ├── outputs.tf      # Output values
    │   └── terraform.tfvars # Variable definitions
    └── prod/               # Production environment
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Prerequisites
- Terraform 1.9.0
- AWS CLI configured with valid credentials
- S3 bucket for remote state (configured in `backend.tf`)

## Usage
1. Initialize Terraform:
```bash
terraform init
```

2. Plan changes for development environment:
```bash
terraform -chdir=environments/dev plan
```

3. Apply changes:
```bash
terraform -chdir=environments/dev apply
```

## Validation
Verify infrastructure deployment:
```bash
terraform -chdir=environments/dev output
```

## Notes
- Each environment (dev/prod) maintains isolated state
- Modules are environment-agnostic and configured via variables
- Never commit `terraform.tfvars` with sensitive values