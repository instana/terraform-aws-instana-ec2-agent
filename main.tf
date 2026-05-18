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