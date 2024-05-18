# variables.tf

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1" // Or your desired default region
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "preferred_availability_zone" {
  description = "Preferred availability zone for public subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "another_availability_zone" {
  description = "Another availability zone for the second private subnet"
  type        = string
  default     = "ap-south-1b"
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "wp"
}
