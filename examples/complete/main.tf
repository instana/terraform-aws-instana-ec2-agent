# ==============================================================================
# Complete Example - Instana Agent EC2 Module
# ==============================================================================
#
# This example demonstrates all available configuration options including:
# - Multiple instances across subnets
# - Custom security group settings
# - SSH access control
# - Custom AMI
# - Detailed monitoring
# - Resource-specific tagging
# - Cost tracking
#
# ==============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "instana_agent" {
  source = "../.."

  # Network Configuration
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  # Security Group Configuration
  create_security_group   = var.create_security_group
  security_group_id       = var.security_group_id
  allowed_ssh_cidr_blocks = var.allowed_ssh_cidr_blocks

  # EC2 Instance Configuration
  instance_type              = var.instance_type
  ami_id                     = var.ami_id
  key_name                   = var.key_name
  root_volume_size           = var.root_volume_size
  enable_detailed_monitoring = var.enable_detailed_monitoring

  # Instana Configuration
  instana_agent_key     = var.instana_agent_key
  instana_endpoint      = var.instana_endpoint
  instana_endpoint_port = var.instana_endpoint_port

  # General Configuration
  name_prefix = var.name_prefix

  # Common Tags
  tags = var.tags

  # Resource-specific Tags
  security_group_tags = var.security_group_tags

  instance_tags = var.instance_tags

  volume_tags = var.volume_tags

  iam_role_tags = var.iam_role_tags

  iam_policy_tags = var.iam_policy_tags

  iam_instance_profile_tags = var.iam_instance_profile_tags
}