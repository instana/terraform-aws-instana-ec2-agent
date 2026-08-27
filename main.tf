# ==============================================================================
# Instana Agent EC2 Terraform Module
# ==============================================================================
#
# This Terraform module deploys EC2 instances with Instana monitoring agent
# for comprehensive AWS infrastructure and application monitoring.
#
# Module Structure:
# ----------------
# - main.tf         : This file - module overview and documentation
# - ec2.tf          : EC2 instances, security groups, and data sources
# - iam.tf          : IAM roles, policies, and instance profiles
# - outputs.tf      : Module output values
# - variables.tf    : Input variable definitions with validation
# - provider.tf     : AWS provider configuration
# - versions.tf     : Terraform and provider version constraints
# - templates/      : Configuration templates (user data, IAM policies)
#
# Usage:
# ------
# This module can be used directly or called from another Terraform configuration.
# See README.md for detailed usage examples and configuration options.
#
# Key Features:
# ------------
# - Automated Instana agent installation via user data
# - Comprehensive IAM permissions for AWS service monitoring
# - Flexible security group management (create new or use existing)
# - Multi-instance deployment with subnet distribution
# - Encrypted EBS volumes
# - Extensive tagging support for cost tracking and organization
# - Input validation for critical parameters
#
# Resources Created:
# -----------------
# - aws_instance                : EC2 instances with Instana agent
# - aws_security_group          : Security group (optional)
# - aws_iam_role                : IAM role for EC2 instances
# - aws_iam_role_policy_attachment : Attaches monitoring policy to role
# - aws_iam_instance_profile    : Instance profile for EC2 instances
#
# For more information, see:
# - README.md for usage documentation
# - CHANGELOG.md for version history
# - https://developer.hashicorp.com/terraform/language/modules/develop
#
# ==============================================================================

# ==============================================================================
# Instana Agent Script Module
# ==============================================================================
# Renders the cloud-agnostic bootstrap script via the instana-agent-script
# module. The rendered script is passed to the EC2 user_data in ec2.tf.
# instana_endpoint_host falls back to instana_endpoint so callers only need
# to set one of the two variables.
# ==============================================================================
module "instana_agent_script" {
  source  = "instana/instana-agent-script/instana"
  version = ">= 1.0.0"

  instana_agent_key     = var.instana_agent_key
  instana_endpoint_host = var.instana_endpoint_host != "" ? var.instana_endpoint_host : var.instana_endpoint
  instana_endpoint_port = var.instana_endpoint_port
  custom_config_yaml    = var.custom_config_yaml
}
