variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "secret_name" {
  description = "Name of the Secrets Manager secret"
  type        = string
  default     = "test-atlantis-secret"
}

variable "secret_description" {
  description = "Description of the Secrets Manager secret"
  type        = string
  default     = "Test secret created by Atlantis"
}

variable "secret_username" {
  description = "Username to store in the secret"
  type        = string
  default     = "testuser"
}

variable "database_name" {
  description = "Database name to store in the secret"
  type        = string
  default     = "testdb"
}

variable "recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Environment = "test"
    Project     = "atlantis-test"
    ManagedBy   = "terraform"
  }
}