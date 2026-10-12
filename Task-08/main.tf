terraform {
  required_version = ">= 1.5.0"
}

variable "project_name" {
  description = "Project name for Task 8 CI/CD"
  type        = string
  default     = "naren-task8"
}

locals {
  project_name = var.project_name
  environment  = "dev"
}

output "project_name" {
  description = "Task 8 project name"
  value       = local.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = local.environment
}

output "terraform_status" {
  description = "Terraform configuration validation"
  value       = "Task 8 configuration loaded successfully"
}
