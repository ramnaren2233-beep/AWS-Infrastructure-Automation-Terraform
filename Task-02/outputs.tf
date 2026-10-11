output "vpc_id" {
  description = "Created VPC ID"
  value       = aws_vpc.main.id
}

output "ec2_instance_id" {
  description = "Created EC2 Instance ID"
  value       = aws_instance.web.id
}

output "elastic_ip" {
  description = "Allocated Elastic IP"
  value       = aws_eip.web.public_ip
}

output "application_url" {
  description = "Application URL"
  value       = "http://${aws_eip.web.public_ip}"
}

output "s3_bucket_name" {
  description = "Created S3 bucket name"
  value       = aws_s3_bucket.project.bucket
}
