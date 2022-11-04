output "s3_bucket_tf_state_id" {
  value       = aws_s3_bucket.s3_bucket_tf_state.id
  description = "The name of the S3 bucket"
}

output "dynamodb_table_tf_state_locks_locks_name" {
  value       = aws_dynamodb_table.dynamodb_table_tf_state_locks_locks.name
  description = "The name of the DynamoDB table"
}

