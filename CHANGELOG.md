# Changelog

## [v1.0.0](https://github.com/instana/terraform-aws-instana-ec2-agent/tree/v1.0.0)

### Changes
- Initial module implementation
- EC2 instance deployment with Instana agent
- IAM role and instance profile creation
- Security group management (create or use existing)
- User data script for automated Instana agent installation
- Support for EC2 instance deployment with configurable subnet selection
- Encrypted EBS volumes
- Comprehensive outputs for all created resources
- Template files for IAM policies and user data
- Support for custom AMI or latest Amazon Linux 2023
- SSH access control via CIDR blocks
- Detailed CloudWatch monitoring option
- Flexible tagging support
