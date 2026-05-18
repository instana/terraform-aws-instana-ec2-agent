# ==============================================================================
# Variables for Basic Example
# ==============================================================================

variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "The VPC ID where EC2 instances will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance deployment"
  type        = string
}

variable "instana_agent_key" {
  description = "Instana agent key for authentication"
  type        = string
  sensitive   = true
}

variable "instana_endpoint" {
  description = "Instana backend endpoint URL"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "instana-agent"
}