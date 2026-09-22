# Changelog

## [v1.0.3](https://github.com/instana/terraform-aws-instana-ec2-agent/tree/v1.0.3)

### Changes
- Added `extra_setup_flags` variable (map of string) to pass arbitrary flags to the Instana setup script; defaults to `{ "m" = "aws" }` for AWS infrastructure monitoring mode
- Forwarded `extra_setup_flags` to the `instana-agent-script` child module
- Added endpoint validation guard (`terraform_data.validate_instana_endpoint`) that raises a clear `precondition` error when both `instana_endpoint_host` and `instana_endpoint` are empty
- Made `instana_endpoint` optional (default `""`) so callers only need to set one of the two endpoint variables

## [v1.0.2](https://github.com/instana/terraform-aws-instana-ec2-agent/tree/v1.0.2)

### Changes
- Replaced inline user data script with the `instana-agent-script` child module
- Added `custom_config_yaml` variable to append custom settings to the agent's `configuration.yaml`
- Added `instana_endpoint_host` variable as an alias for `instana_endpoint`
- Added `examples/configuration.yaml.example` as a starter custom configuration file

## [v1.0.1](https://github.com/instana/terraform-aws-instana-ec2-agent/tree/v1.0.1)

### Documentation
- Enhanced README usage section with module example code block
- Added direct GitHub links to examples directory for easier navigation
- Improved clarity of getting started instructions

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
