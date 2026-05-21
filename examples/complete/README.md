# Complete Example

This example demonstrates all available configuration options for the Instana Agent EC2 module, including:

- Custom security group settings
- SSH access control
- Custom AMI configuration
- Detailed CloudWatch monitoring
- Resource-specific tagging
- Custom tags

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your values:
   ```hcl
   vpc_id            = "vpc-xxxxxxxxx"
   subnet_id         = "subnet-xxx"
   instana_agent_key = "your-instana-agent-key"
   instana_endpoint  = "ingress-blue-saas.instana.io"
   
   # Optional: Configure SSH access
   allowed_ssh_cidr_blocks = ["10.0.0.0/8"]
   key_name                = "my-key-pair"
   
   ```

3. Initialize and apply:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## What This Example Creates

- 1 EC2 instance (m5.large) with Instana agent
- Security group with SSH access control
- IAM role, IAM policy, and instance profile for AWS monitoring
- Encrypted EBS root volume (8 GB)
- Optional detailed CloudWatch monitoring
- Comprehensive tagging for tracking and organization

## Configuration Highlights

### Security
- Optional SSH access from specific CIDR blocks
- Encrypted EBS volumes
- IAM role with least-privilege permissions

### Monitoring
- Detailed CloudWatch monitoring enabled
- Instana agent auto-configured for comprehensive AWS service monitoring

### Tagging Strategy
- Common tags applied to all resources
- Resource-specific tags for granular organization

## Outputs

All available outputs are exposed:
- Instance IDs, IPs, and ARNs
- IAM role and instance profile details
- Security group information

## Clean Up

```bash
terraform destroy
```

## Customization

You can customize this example by:
- Adjusting instance type
- Modifying volume sizes
- Changing security group rules
- Adding custom tags
- Configuring different Instana endpoints