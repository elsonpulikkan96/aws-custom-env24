output "ec2_ssm_profile_arn" {
  value       = aws_iam_instance_profile.ec2_ssm_profile.arn
  description = "The ARN of the EC2 SSM instance profile"
}
