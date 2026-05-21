# ==============================================================================
# Output Values
# ==============================================================================
#
# This file defines all output values from the Instana Agent EC2 module.
# Outputs are organized by resource type for easy reference.
#
# ==============================================================================

# ------------------------------------------------------------------------------
# EC2 Instance Outputs
# ------------------------------------------------------------------------------

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.instana_agent.id
}

output "instance_private_ip" {
  description = "Private IP address of EC2 instance"
  value       = aws_instance.instana_agent.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of EC2 instance (if assigned)"
  value       = aws_instance.instana_agent.public_ip
}

output "instance_arn" {
  description = "ARN of EC2 instance"
  value       = aws_instance.instana_agent.arn
}

# ------------------------------------------------------------------------------
# IAM Outputs
# ------------------------------------------------------------------------------

output "iam_role_arn" {
  description = "ARN of the IAM role used by Instana agent"
  value       = aws_iam_role.instana_agent.arn
}

output "iam_role_name" {
  description = "Name of the IAM role used by Instana agent"
  value       = aws_iam_role.instana_agent.name
}

output "iam_instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.instana_agent.arn
}

output "iam_instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.instana_agent.name
}

# ------------------------------------------------------------------------------
# Security Group Outputs
# ------------------------------------------------------------------------------

output "security_group_id" {
  description = "ID of the security group used by EC2 instances"
  value       = var.create_security_group ? one(aws_security_group.instana_agent[*].id) : var.security_group_id
}

output "security_group_name" {
  description = "Name of the security group used by EC2 instances"
  value       = var.create_security_group ? one(aws_security_group.instana_agent[*].name) : null
}