variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "ec2_instance_ids" {
  type = list(string)
}

variable "environment" {
  type = string
}