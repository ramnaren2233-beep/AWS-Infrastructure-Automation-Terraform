terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "task8_proof" {
  filename = "${path.module}/task8_done.txt"
  content  = "Task 8 GitHub Actions CI/CD with Terraform is successful!"
}

output "status_message" {
  value = "Infrastructure deployed and validated successfully for Task 8."
}
