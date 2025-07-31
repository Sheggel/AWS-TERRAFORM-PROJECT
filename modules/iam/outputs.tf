output "ec2_role_name" {
  value = aws_iam_role.ec2_s3_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}