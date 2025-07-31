# main.tf
provider "aws" {
  region = var.region
}

module "s3" {
  source         = "./modules/s3"
  bucket_name    = var.s3_bucket_name
  environment    = var.environment
}

module "networking" {
  source             = "./modules/networking"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones = var.availability_zones
  environment        = var.environment
}

module "iam" {
  source         = "./modules/iam"
  s3_bucket_name = module.s3.bucket_name
  environment    = var.environment
}

module "ec2" {
  source                  = "./modules/ec2"
  vpc_id                  = module.networking.vpc_id
  public_subnet_ids       = module.networking.public_subnet_ids
  security_group_id       = module.networking.ec2_security_group_id
  instance_type           = var.instance_type
  ami_id                  = var.ami_id
  iam_instance_profile_name = module.iam.instance_profile_name
  environment             = var.environment
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  security_group_id = module.networking.alb_security_group_id
  ec2_instance_ids  = module.ec2.instance_ids
  environment       = var.environment
}