resource "aws_iam_role" "ec2_role" {
  name = "Project-03-EC2-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "Project-03-EC2-Role"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "Project-03-EC2-Instance-Profile"
  role = aws_iam_role.ec2_role.name
}
