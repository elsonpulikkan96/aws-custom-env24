# modules/vpc/variables.tf

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "preferred_availability_zone" {
  description = "Preferred availability zone for public subnet"
  type        = string
}

variable "another_availability_zone" {
  description = "Another availability zone for the second private subnet"
  type        = string
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

