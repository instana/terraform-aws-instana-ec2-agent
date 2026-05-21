# Examples

This directory contains example configurations demonstrating how to use the Instana Agent EC2 Terraform module.

## Available Examples

### [Basic Example](./basic/)
Minimal configuration to get started quickly with Instana agent deployment.

**Use this example if you:**
- Want to quickly test the module
- Need a simple single-instance deployment
- Are new to the module

**What it includes:**
- Single EC2 instance (m5.large)
- Auto-created security group
- Latest Amazon Linux 2023 AMI
- Basic configuration only

[View Basic Example →](./basic/)

---

### [Complete Example](./complete/)
Comprehensive configuration showcasing all available features and options.

**Use this example if you:**
- Need a production-ready deployment
- Want to see all available configuration options
- Require advanced features like cost tracking and custom tagging

**What it includes:**
- Single instance (m5.large) with full configuration options
- SSH access control
- Optional detailed CloudWatch monitoring
- Resource-specific tagging
- Custom configuration options

[View Complete Example →](./complete/)

---

## Quick Start

1. **Choose an example** based on your needs (basic or complete)

2. **Navigate to the example directory:**
   ```bash
   cd examples/basic  # or examples/complete
   ```

3. **Copy the example variables file:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

4. **Edit terraform.tfvars** with your actual values:
   ```hcl
   vpc_id            = "vpc-xxxxxxxxx"
   subnet_id         = "subnet-xxxxxxxxx"
   instana_agent_key = "your-instana-agent-key"
   instana_endpoint  = "ingress-blue-saas.instana.io"
   ```

5. **Initialize and apply:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Module Source Path

Both examples reference the module using a relative path:
```hcl
module "instana_agent" {
  source = "../.."  # Points to the root module directory
  # ...
}
```

If you're using these examples as templates for your own configuration, update the `source` to point to your module location:
```hcl
# Local path
source = "./path/to/module"

# Git repository
source = "git::https://github.com/your-org/terraform-instana-agent.git?ref=v1.0.0"

# Terraform Registry (if published)
source = "your-org/instana-agent/aws"
version = "1.0.0"
```

## Testing Examples

To test an example without applying:
```bash
cd examples/basic  # or examples/complete
terraform init
terraform plan
```

## Cleaning Up

To destroy resources created by an example:
```bash
cd examples/basic  # or examples/complete
terraform destroy
```