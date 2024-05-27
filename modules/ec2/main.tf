# EC2 Instance(s)
resource "aws_instance" "public_instance" {
  count                    = var.public_instance_count
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.public_subnet_id
  vpc_security_group_ids  = var.security_group_ids
  key_name                = var.key_pair_name
  iam_instance_profile    = split("/", var.iam_instance_profile_arn)[1]
  user_data               = templatefile("${path.module}/scripts/bootstrap.sh", {})
  tags = {
    Name        = "${var.project_name}-public-ec2-${count.index + 1}"
    Project     = var.project_name
  }
}

resource "aws_instance" "private_instance_1" {
  count                    = var.private_instance_1_count
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.private_subnet_1_id
  vpc_security_group_ids  = var.security_group_ids
  key_name                = var.key_pair_name
  iam_instance_profile    = split("/", var.iam_instance_profile_arn)[1]
  user_data               = templatefile("${path.module}/scripts/bootstrap.sh", {})
  tags = {
    Name        = "${var.project_name}-private-ec2-1-${count.index + 1}"
    Project     = var.project_name
  }
}

resource "aws_instance" "private_instance_2" {
  count                    = var.private_instance_2_count
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.private_subnet_2_id
  vpc_security_group_ids  = var.security_group_ids
  key_name                = var.key_pair_name
  iam_instance_profile    = split("/", var.iam_instance_profile_arn)[1]
  user_data               = templatefile("${path.module}/scripts/bootstrap.sh", {})
  tags = {
    Name        = "${var.project_name}-private-ec2-2-${count.index + 1}"
    Project     = var.project_name
  }
}

# Output for All Instance IDs
output "instance_ids" {
  description = "List of all EC2 instance IDs"
  value = concat(
    aws_instance.public_instance.*.id,
    aws_instance.private_instance_1.*.id,
    aws_instance.private_instance_2.*.id
  )
}
