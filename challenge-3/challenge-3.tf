terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
 region = "us-east-1"
}


resource "aws_launch_template" "this" {
    name     = "terraform-launch-template"
    image_id = "ami-06b21ccaeff8cd686"
    instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "dev" {
  availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key   = "Team"
    value = "SRE"
    propagate_at_launch = true
  }
}

resource "aws_iam_user" "lb" {
  count = 1
  name = "success-user"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "ec2-describe-policy"
  user = "success-user"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data "aws_caller_identity" "local" {}

resource "local_file" "this" {
  content = data.aws_caller_identity.local.account_id
  filename = "account-number.txt"
}