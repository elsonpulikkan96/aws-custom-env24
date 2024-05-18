# modules/ec2/variables.tf

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "private_subnet_1_id" {
  description = "The ID of the first private subnet"
  type        = string
}

variable "private_subnet_2_id" {
  description = "The ID of the second private subnet"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "security_group_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
}

variable "public_instance_count" {
  type        = number
  default     = 1
  description = "Number of public EC2 instances to create"
}

variable "private_instance_1_count" {
  type        = number
  default     = 1
  description = "Number of private EC2 instances to create in the first subnet"
}

variable "private_instance_2_count" {
  type        = number
  default     = 1
  description = "Number of private EC2 instances to create in the second subnet"
}
variable "iam_instance_profile_arn" {
  type        = string
  description = "ARN of the IAM instance profile to attach to the EC2 instances"
}
