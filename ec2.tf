# Data source to get Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  count       = var.ami_id == "" ? 1 : 0
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# Security Group for Instana Agent EC2 instances
# This is an EC2/VPC Security Group (found in EC2 console -> Security Groups)
resource "aws_security_group" "instana_agent" {
  count       = var.create_security_group ? 1 : 0
  name_prefix = "${var.name_prefix}-sg-"
  description = "Security group for Instana Agent EC2 instances"
  vpc_id      = var.vpc_id

  # Allow SSH access if CIDR blocks are provided
  dynamic "ingress" {
    for_each = length(var.allowed_ssh_cidr_blocks) > 0 ? [1] : []
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = var.allowed_ssh_cidr_blocks
      description = "SSH access"
    }
  }

  # Allow all outbound traffic for Instana agent communication
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic for Instana agent communication"
  }

  tags = merge(
    var.tags,
    var.security_group_tags
  )
}

# Data source for existing security group
data "aws_security_group" "instana_agent" {
  count = var.create_security_group ? 0 : 1
  id    = var.security_group_id
}

# EC2 Instances with Instana Agent
resource "aws_instance" "instana_agent" {
  ami           = var.ami_id != "" ? var.ami_id : one(data.aws_ami.amazon_linux[*].id)
  instance_type = var.instance_type

  # SSH Key Pair: Specify the name of an existing AWS key pair
  # Note: You must have the corresponding private key to SSH into the instance
  # If not specified (empty string), the instance will be created without SSH access
  key_name = var.key_name != "" ? var.key_name : null

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.create_security_group ? [one(aws_security_group.instana_agent[*].id)] : [one(data.aws_security_group.instana_agent[*].id)]

  iam_instance_profile = aws_iam_instance_profile.instana_agent.name

  monitoring = var.enable_detailed_monitoring

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true

    tags = merge(
      var.tags,
      var.volume_tags
    )
  }

  user_data = templatefile("${path.module}/templates/user_data.sh.tftpl", {
    instana_agent_key     = var.instana_agent_key
    instana_endpoint      = var.instana_endpoint
    instana_endpoint_port = var.instana_endpoint_port
  })

  tags = merge(
    var.tags,
    var.instance_tags,
    {
      Name = "${var.name_prefix}-instance"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}