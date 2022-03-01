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

output "statit_vpc_id" {
  value       = aws_vpc.statit_vpc.id
  description = "The VPC ID"
}

output "statit_igw_id" {
  value       = aws_internet_gateway.statit_igw.id
  description = "IGW ID"
}

output "statit_rt_id" {
  value       = aws_route_table.statit_rt.id
  description = "RT ID"
}

output "statit_sg_id" {
  value       = aws_security_group.statit_sg.id
  description = "SG ID"
}

output "statit_subnet_id" {
  value       = aws_subnet.statit_subnet.id
  description = "Subnet ID"
}

output "statit_ec2_instance_id" {
  value       = aws_instance.statit_ec2_instance.id
  description = "Instance ID"
}