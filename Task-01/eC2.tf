data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.web.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              cat <<'HTML' > /usr/share/nginx/html/index.html
              <!DOCTYPE html>
              <html>
              <head>
                <title>Project 03</title>
              </head>
              <body>
                <h1>Project 03 - Terraform Web Server</h1>
                <p>Nginx is running successfully!</p>
              </body>
              </html>
              HTML
              EOF

  tags = {
    Name = "Project-03-Web-Server"
  }
}
