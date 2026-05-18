# Basic Example

This example demonstrates the minimal configuration required to deploy Instana agents on EC2 instances.

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your values:
   ```hcl
   vpc_id            = "vpc-xxxxxxxxx"
   subnet_id         = "subnet-xxxxxxxxx"
   instana_agent_key = "your-instana-agent-key"
   instana_endpoint  = "ingress-blue-saas.instana.io"
   ```

3. Initialize and apply:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## What This Example Creates

- 1 EC2 instance (m5.large) with Instana agent
- Security group with outbound internet access
- IAM role, IAM policy, and instance profile for AWS monitoring
- Encrypted EBS root volume (8 GB)

## Outputs

- `instance_id` - EC2 instance ID
- `instance_private_ip` - Private IP address of the instance
- `security_group_id` - ID of the security group

## Clean Up

```bash
terraform destroy