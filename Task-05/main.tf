# EC2 Web Server Configuration with User Data
resource "aws_instance" "web_server" {
  ami           = "ami-08e3b3155fc937a94"
  instance_type = "t2.micro"

  # Install Nginx and deploy a custom landing page
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Welcome to Custom Landing Page via Elastic IP!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "EC2-Web-Server-Task5"
  }
}

# Elastic IP allocation for the instance
resource "aws_eip" "web_eip" {
  instance = aws_instance.web_server.id
  domain   = "vpc"
}
