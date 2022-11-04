terraform {
  # backend "s3" {
  #   bucket                    = "xx-tf-remote-state-all"
  #   key                       = "AWS/xx/us-east-1/backend/terraform.tfstate"
  #   region                    = "us-east-1"
  #   dynamodb_table            = "xx-tf-remote-state-locks-all"
  #   encrypt                   = true
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.73.0"
    }
  }

  required_version = ">= 1.1.4"
}

provider "aws" {
  
	region 								= var.aws_region

  default_tags {
    tags = {

      "Environment"     = var.env_name
      "Team"            = var.team
      "DeployedBy"      = var.deployedby
      "Application"     = var.app_name
      "OwnerEmail"      = var.aws_profile
      "Region"          = var.aws_region
    }
  }
}

# Create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb_table_tf_state_locks" {

  name         = var.dynamodb_table_tf_state_locks
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name"        = var.dynamodb_table_tf_state_locks
    "Description" = "DynamoDB terraform table to lock states"
  }
}

# Create an S3 bucket to store the state file in
resource "aws_s3_bucket" "s3_bucket_tf_state" {
  bucket = var.s3_bucket_tf_state
 
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = var.s3_bucket_tf_state
    Description = "S3 Remote Terraform State Store"
  }
}

#
resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {

  bucket                  = aws_s3_bucket.s3_bucket_tf_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}



