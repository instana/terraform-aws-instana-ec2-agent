# ==============================================================================
# Outputs for Basic Example
# ==============================================================================

output "instance_id" {
  description = "EC2 instance ID"
  value       = module.instana_agent.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the instance"
  value       = module.instana_agent.instance_private_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.instana_agent.security_group_id
}