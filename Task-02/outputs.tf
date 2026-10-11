output "aws_region" {
  description = "AWS region configured for this project"
  value       = var.aws_region
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "vpc_cidr" {
  description = "Configured VPC CIDR"
  value       = var.vpc_cidr
}

output "instance_type" {
  description = "Configured EC2 instance type"
  value       = var.instance_type
}
