# modules/ec2/outputs.tf

output "public_instance_ids" {
  value       = aws_instance.public_instance.*.id
  description = "IDs of public EC2 instances"
}

output "private_instance_1_ids" {
  value       = aws_instance.private_instance_1.*.id
  description = "IDs of private EC2 instances in the first subnet"
}

output "private_instance_2_ids" {
  value       = aws_instance.private_instance_2.*.id
  description = "IDs of private EC2 instances in the second subnet"
}
