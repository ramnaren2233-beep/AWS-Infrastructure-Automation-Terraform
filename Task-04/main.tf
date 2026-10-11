terraform {
  backend "s3" {
    bucket         = "naren-tfstate-project03-oct2026"
    key            = "task4/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locking-table"
  }
}

# Sample Resource
resource "aws_vpc" "task4_vpc" {
  cidr_block = "10.4.0.0/16"

  tags = {
    Name = "task4-vpc"
  }
}
