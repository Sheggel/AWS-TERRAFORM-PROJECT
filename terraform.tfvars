# terraform.tfvars
region             = "us-east-1"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
instance_type      = "t3.micro"
s3_bucket_name     = "my-app-bucket-20250730"  # Unique bucket name
environment        = "prod"
ami_id             = "ami-0123456789abcdef0"  