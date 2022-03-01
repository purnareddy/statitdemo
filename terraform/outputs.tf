output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}
output "statit_s3_bucket_id" {
  value       = aws_s3_bucket.statit_s3_bucket.id
  description = "The ARN of the S3 bucket"
}