# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a random password for the secret
resource "random_password" "secret_password" {
  length  = 16
  special = true
}

# Create AWS Secrets Manager secret
resource "aws_secretsmanager_secret" "test_secret" {
  name                    = var.secret_name
  description             = var.secret_description
  recovery_window_in_days = var.recovery_window_in_days

  tags = var.tags
}

# Store the secret value
resource "aws_secretsmanager_secret_version" "test_secret" {
  secret_id     = aws_secretsmanager_secret.test_secret.id
  secret_string = jsonencode({
    username = var.secret_username
    password = random_password.secret_password.result
    database = var.database_name
  })
}

# Create IAM policy for accessing the secret
resource "aws_iam_policy" "secrets_manager_policy" {
  name        = "${var.secret_name}-access-policy"
  description = "Policy to access ${var.secret_name} secret"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = aws_secretsmanager_secret.test_secret.arn
      }
    ]
  })

  tags = var.tags
}
