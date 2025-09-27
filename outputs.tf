output "secret_arn" {
  description = "ARN of the created secret"
  value       = aws_secretsmanager_secret.test_secret.arn
}

output "secret_name" {
  description = "Name of the created secret"
  value       = aws_secretsmanager_secret.test_secret.name
}

output "secret_id" {
  description = "ID of the created secret"
  value       = aws_secretsmanager_secret.test_secret.id
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy for secret access"
  value       = aws_iam_policy.secrets_manager_policy.arn
}

output "secret_version_id" {
  description = "Version ID of the secret"
  value       = aws_secretsmanager_secret_version.test_secret.version_id
}