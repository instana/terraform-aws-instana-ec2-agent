# ==============================================================================
# Input Variables
# ==============================================================================
#
# This file defines all input variables for the Instana Agent EC2 module.
# Variables are organized into logical groups for better maintainability.
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Network Configuration
# ------------------------------------------------------------------------------
variable "vpc_id" {
  description = "The VPC ID where EC2 instances will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance deployment"
  type        = string
}

# ------------------------------------------------------------------------------
# Security Group Configuration
# ------------------------------------------------------------------------------
variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "The security group ID for EC2 instances (required if create_security_group is false)"
  type        = string
  default     = ""

  validation {
    condition     = var.create_security_group || var.security_group_id != ""
    error_message = "If 'create_security_group' is false, 'security_group_id' must be provided."
  }
}

variable "allowed_ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH into EC2 instances"
  type        = list(string)
  default     = []
}

# ------------------------------------------------------------------------------
# EC2 Instance Configuration
# ------------------------------------------------------------------------------
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m5.large"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (leave empty to use latest Amazon Linux 2023)"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Size of root volume in GB"
  type        = number
  default     = 8

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 16384
    error_message = "Root volume size must be between 8 GB and 16384 GB."
  }
}

variable "enable_detailed_monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = false
}

# ------------------------------------------------------------------------------
# Instana Agent Configuration
# ------------------------------------------------------------------------------
variable "instana_agent_key" {
  description = "Instana agent key for authentication"
  type        = string
  sensitive   = true
}

variable "instana_endpoint" {
  description = "Instana backend endpoint URL (e.g., ingress-pink-saas.instana.rocks, ingress-blue-saas.instana.io)"
  type        = string
}

variable "instana_endpoint_port" {
  description = "Instana backend endpoint port"
  type        = number
  default     = 443

  validation {
    condition     = var.instana_endpoint_port > 0 && var.instana_endpoint_port <= 65535
    error_message = "Port must be between 1 and 65535."
  }
}

# ------------------------------------------------------------------------------
# General Configuration
# ------------------------------------------------------------------------------
variable "region" {
  description = "AWS region for deployment (e.g., us-east-1, us-west-2, eu-west-1)"
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "instana-agent"
}

# ------------------------------------------------------------------------------
# Tagging Configuration
# ------------------------------------------------------------------------------

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "security_group_tags" {
  description = "Additional tags to apply to the security group"
  type        = map(string)
  default     = {}
}

variable "instance_tags" {
  description = "Additional tags to apply to EC2 instances"
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "Additional tags to apply to EBS volumes (root_block_device)"
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "Additional tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}

variable "iam_policy_tags" {
  description = "Additional tags to apply to the IAM policy"
  type        = map(string)
  default     = {}
}

variable "iam_instance_profile_tags" {
  description = "Additional tags to apply to the IAM instance profile"
  type        = map(string)
  default     = {}
}