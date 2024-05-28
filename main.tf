provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# VPC Module
module "vpc" {
  source                      = "./modules/vpc"
  vpc_cidr_block              = var.vpc_cidr_block
  public_subnet_cidr_block    = var.public_subnet_cidr_block
  private_subnet_1_cidr_block = var.private_subnet_1_cidr_block
  private_subnet_2_cidr_block = var.private_subnet_2_cidr_block
  preferred_availability_zone = var.preferred_availability_zone
  another_availability_zone   = var.another_availability_zone
  project_name                = var.project_name
}


# EC2 Module
module "ec2" {
  source                   = "./modules/ec2"
  vpc_id                   = module.vpc.vpc_id
  depends_on               = [module.iam]
  public_subnet_id         = module.vpc.public_subnet_id
  private_subnet_1_id      = module.vpc.private_subnet_1_id
  private_subnet_2_id      = module.vpc.private_subnet_2_id
  ami_id                   = var.ami_id
  key_pair_name            = var.key_pair_name
  project_name             = var.project_name
  iam_instance_profile_arn = module.iam.ec2_ssm_profile_arn
  security_group_ids       = module.vpc.security_group_ids
}


# IAM Module
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}


# CloudWatch Alarms Module
module "cloudwatch_alarms" {
  source        = "./modules/cw-alarms"
  alarm_actions = ["arn:aws:sns:ap-south-1:471112860991:aws-custom-env"]
  cpu_threshold = 80
  depends_on    = [module.ec2]
  instance_ids  = module.ec2.instance_ids
}
