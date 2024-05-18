# modules/iam/main.tf

resource "aws_iam_role" "ec2_ssm_role" {
  name               = "${var.project_name}-ec2-ssm-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
  tags               = {
    Project = var.project_name
  }
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "ec2_ssm_policy" {
  name        = "${var.project_name}-ec2-ssm-policy"
  path        = "/"
  description = "Policy to allow EC2 instances to use SSM"
  policy      = data.aws_iam_policy_document.ec2_ssm_policy_document.json
  tags = {
    Project = var.project_name
  }
}

data "aws_iam_policy_document" "ec2_ssm_policy_document" {
  statement {
    actions = [
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "s3:GetEncryptionConfiguration"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = aws_iam_policy.ec2_ssm_policy.arn
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "${var.project_name}-ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm_role.name
  tags = {
    Project = var.project_name
  }
}

