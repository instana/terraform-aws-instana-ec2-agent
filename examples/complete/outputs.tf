# ==============================================================================
# Outputs for Complete Example
# ==============================================================================

output "instance_id" {
  description = "EC2 instance ID"
  value       = module.instana_agent.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the instance"
  value       = module.instana_agent.instance_private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the instance (if assigned)"
  value       = module.instana_agent.instance_public_ip
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = module.instana_agent.instance_arn
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.instana_agent.iam_role_arn
}

output "iam_role_name" {
  description = "Name of the IAM role"
  value       = module.instana_agent.iam_role_name
}

output "iam_instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value       = module.instana_agent.iam_instance_profile_arn
}

output "iam_instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = module.instana_agent.iam_instance_profile_name
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.instana_agent.security_group_id
}

output "security_group_name" {
  description = "Name of the security group"
  value       = module.instana_agent.security_group_name
}