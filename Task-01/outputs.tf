output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "ID of public subnet 1"
  value       = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  description = "ID of public subnet 2"
  value       = aws_subnet.public_2.id
}

output "security_group_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web.id
}

output "ec2_instance_id" {
  description = "ID of the EC2 web server"
  value       = aws_instance.web.id
}

output "elastic_ip" {
  description = "Elastic IP of the web server"
  value       = aws_eip.web.public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.project.bucket
}

output "website_url" {
  description = "URL of the web server"
  value       = "http://${aws_eip.web.public_ip}"
}
