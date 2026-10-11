# 1. AWS Security Group Configuration
resource "aws_security_group" "secure_sg" {
  name        = "task7-least-privilege-sg"
  description = "Allow HTTP access"
  vpc_id      = "vpc-002e92a3ff21d7fe4"

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "task7-least-privilege-sg"
  }
}

# 2. IAM Least-Privilege Role for EC2
resource "aws_iam_role" "ec2_least_privilege_role" {
  name = "EC2-Least-Privilege-Role-Task07"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# 3. S3 Read-Only Policy for Specific Bucket
resource "aws_iam_policy" "s3_read_only_policy" {
  name        = "S3ReadOnlyAccessPolicyTask07"
  description = "Read-only access to the specified S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "ListSpecificBucket"
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = "arn:aws:s3:::naren-tfstate-project03-oct2026"
      },
      {
        Sid      = "ReadObjectsInSpecificBucket"
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "arn:aws:s3:::naren-tfstate-project03-oct2026/*"
      }
    ]
  })
}

# 4. Attach Policy to IAM Role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_least_privilege_role.name
  policy_arn = aws_iam_policy.s3_read_only_policy.arn
}

# 5. IAM Instance Profile for EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2-Instance-Profile-Task07"
  role = aws_iam_role.ec2_least_privilege_role.name
}
