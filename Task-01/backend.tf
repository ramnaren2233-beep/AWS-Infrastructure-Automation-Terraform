
terraform {
  backend "s3" {
    bucket       = "naren-tfstate-project03-oct2026"
    key          = "project-03/task-01/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
