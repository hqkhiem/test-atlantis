# Test Atlantis - AWS Secrets Manager

This repository contains Terraform configuration to test Atlantis by provisioning an AWS Secrets Manager secret.

## Resources Created

- AWS Secrets Manager secret with a random password
- IAM policy for accessing the secret
- Secret version with JSON-encoded credentials

## Prerequisites

- AWS credentials configured
- Terraform >= 1.0
- Atlantis configured to manage this repository

## Usage

### Using Atlantis

1. Create a pull request with changes to this repository
2. Atlantis will automatically run `terraform plan`
3. Comment `atlantis apply` to apply the changes

### Manual Usage

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

## Configuration

The following variables can be customized:

- `secret_name`: Name of the secret (default: "test-atlantis-secret")
- `secret_description`: Description of the secret
- `secret_username`: Username stored in the secret (default: "testuser")
- `database_name`: Database name stored in the secret (default: "testdb")
- `aws_region`: AWS region (default: "ap-southeast-1")
- `recovery_window_in_days`: Secret recovery window (default: 7)
- `tags`: Resource tags

## Outputs

- `secret_arn`: ARN of the created secret
- `secret_name`: Name of the created secret
- `secret_id`: ID of the created secret
- `iam_policy_arn`: ARN of the IAM policy
- `secret_version_id`: Version ID of the secret

## Cleanup

To destroy the resources:

```bash
terraform destroy
```

Or use Atlantis:
- Comment `atlantis apply -d .` to destroy