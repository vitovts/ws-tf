# --- Creds ---

# AWS Region
variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

# Profile to AWS
variable "aws_profile" {
	description = "AWS profile"
  default     = "tf"
}

# --- Application ---
# Application name
variable "app_name" {
	description = "Application name"
  default     = "xx"
}

# --- Environment ---
# Environment name
variable "env_name" {
	description = "Environment name"
  default     = "xx"
}

variable "team" {
	description = "Team"
}

variable "deployedby" {
	description = "DeployedBy"
}

# S3 for tfstate
variable "s3_bucket_tf_state" {
  description = "S3 bucket for holding Terraform state files. Must be globally unique."
  type        = string
}

# DynamoDB for tfstate
variable "dynamodb_table_tf_state_locks" {
  description = "DynamoDB table for locking Terraform states"
  type        = string
}
