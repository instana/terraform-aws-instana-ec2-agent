# ==============================================================================
# Variables for Complete Example
# ==============================================================================

# AWS Configuration
variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-2"
}

# Network Configuration
variable "vpc_id" {
  description = "The VPC ID where EC2 instances will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance deployment"
  type        = string
}

# Security Group Configuration
variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "Existing security group ID (if not creating new)"
  type        = string
  default     = ""
}

variable "allowed_ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH into EC2 instances"
  type        = list(string)
  default     = []
}

# EC2 Instance Configuration
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
}

variable "enable_detailed_monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = false
}

# Instana Configuration
variable "instana_agent_key" {
  description = "Instana agent key for authentication"
  type        = string
  sensitive   = true
}

variable "instana_endpoint" {
  description = "Instana backend endpoint URL"
  type        = string
}

variable "instana_endpoint_port" {
  description = "Instana backend endpoint port"
  type        = number
  default     = 443
}

# General Configuration
variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "instana-agent"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# Resource-specific Tags
variable "security_group_tags" {
  description = "Additional tags for security group"
  type        = map(string)
  default     = {}
}

variable "instance_tags" {
  description = "Additional tags for EC2 instances"
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "Additional tags for EBS volumes"
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "Additional tags for IAM role"
  type        = map(string)
  default     = {}
}

variable "iam_policy_tags" {
  description = "Additional tags for IAM policy"
  type        = map(string)
  default     = {}
}

variable "iam_instance_profile_tags" {
  description = "Additional tags for IAM instance profile"
  type        = map(string)
  default     = {}
}