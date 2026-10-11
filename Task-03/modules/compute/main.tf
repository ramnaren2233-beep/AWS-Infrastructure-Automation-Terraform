resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "${var.environment}-web-instance"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

variable "ami_id" {}

variable "instance_type" {}

variable "environment" {}
