# modules/vpc/output.tf

output "vpc_id" {
  value       = aws_vpc.my_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "The ID of the public subnet"
}

output "private_subnet_1_id" {
  value       = aws_subnet.private_subnet_1.id
  description = "The ID of the first private subnet"
}

output "private_subnet_2_id" {
  value       = aws_subnet.private_subnet_2.id
  description = "The ID of the second private subnet"
}

output "security_group_ids" {
  value = [aws_security_group.http_access.id, aws_security_group.remote_access.id]
  description = "List of security group IDs"
}

