# Instana Agent EC2 - Terraform Module

A Terraform module for deploying Instana monitoring agents on AWS EC2 instances with comprehensive AWS monitoring capabilities.


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5 |
| aws | >= 5.0 |

## Prerequisites

Before running this module, ensure the user or IAM role executing Terraform has sufficient AWS permissions to create and manage:
- EC2 instances
- IAM roles
- IAM policies
- IAM instance profiles
- Security groups
- EBS volumes

## Usage

Refer to the `examples` folder for usage examples and sample configurations.
It includes example Terraform configurations to help you get started with this module.

## Inputs

### Required Variables

This module requires the following variables to be provided explicitly:

| Name | Description | Type |
|------|-------------|------|
| vpc_id | The VPC ID where EC2 instances will be deployed | `string` |
| subnet_id | Subnet ID for EC2 instance deployment | `string` |
| instana_agent_key | Instana agent key for authentication | `string` (sensitive) |
| instana_endpoint | Instana backend endpoint URL | `string` |

### Optional Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| instance_type | EC2 instance type | `string` | `"m5.large"` |
| ami_id | AMI ID (empty = latest Amazon Linux 2023) | `string` | `""` |
| key_name | EC2 key pair name for SSH access | `string` | `""` |
| root_volume_size | Size of root volume in GB | `number` | `8` |
| enable_detailed_monitoring | Enable detailed CloudWatch monitoring | `bool` | `false` |
| create_security_group | Whether to create a new security group | `bool` | `true` |
| security_group_id | Existing security group ID (if not creating new) | `string` | `""` |
| allowed_ssh_cidr_blocks | List of CIDR blocks allowed to SSH | `list(string)` | `[]` |
| instana_endpoint_port | Instana backend endpoint port | `number` | `443` |
| name_prefix | Prefix for resource names | `string` | `"instana-agent"` |
| tags | Common tags to apply to all resources | `map(string)` | `{}` |
| security_group_tags | Additional tags for security group | `map(string)` | `{}` |
| instance_tags | Additional tags for EC2 instances | `map(string)` | `{}` |
| volume_tags | Additional tags for EBS volumes | `map(string)` | `{}` |
| iam_role_tags | Additional tags for IAM role | `map(string)` | `{}` |
| iam_policy_tags | Additional tags for IAM policy | `map(string)` | `{}` |
| iam_instance_profile_tags | Additional tags for IAM instance profile | `map(string)` | `{}` |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| instance_private_ip | Private IP address of the instance |
| instance_public_ip | Public IP address of the instance (if assigned) |
| instance_arn | ARN of the EC2 instance |
| iam_role_arn | ARN of the IAM role |
| iam_role_name | Name of the IAM role |
| iam_instance_profile_arn | ARN of the IAM instance profile |
| iam_instance_profile_name | Name of the IAM instance profile |
| security_group_id | ID of the security group |
| security_group_name | Name of the security group |

## Resources Created

This module creates the following AWS resources:

- **EC2 Instance**: Runs the Instana agent
- **IAM Role**: Grants monitoring permissions to the instance
- **IAM Policy**: Defines the AWS permissions required by Instana
- **IAM Instance Profile**: Attaches the IAM role to the EC2 instance
- **Security Group** (optional): Controls network access to the instance
- **Root EBS Volume**: Provides encrypted storage for the EC2 instance
