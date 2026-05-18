# IAM Role for EC2 Instana Agent
# This role allows EC2 instances to assume it and grants permissions for AWS resource monitoring

# IAM Assume Role Policy (Trust Relationship)
# Allows EC2 service to assume this role
resource "aws_iam_role" "instana_agent" {
  name_prefix        = "${var.name_prefix}-role-ec2-"
  assume_role_policy = file("${path.module}/templates/trust_relationship.json.tftpl")

  tags = merge(
    var.tags,
    var.iam_role_tags
  )
}

# # IAM Policy for Instana Agent
# # Contains comprehensive permissions for monitoring AWS resources
resource "aws_iam_policy" "instana_agent" {
  name_prefix = "${var.name_prefix}-policy-ec2-"
  description = "Policy for Instana Agent to discover and monitor AWS resources"
  policy      = file("${path.module}/templates/IAM_permission.json.tftpl")

  tags = merge(
    var.tags,
    var.iam_policy_tags
  )
}

# Attach monitoring policy to role
resource "aws_iam_role_policy_attachment" "instana_monitoring" {
  role       = aws_iam_role.instana_agent.name
  policy_arn = aws_iam_policy.instana_agent.arn
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "instana_agent" {
  name_prefix = "${var.name_prefix}-profile-ec2-"
  role        = aws_iam_role.instana_agent.name

  tags = merge(
    var.tags,
    var.iam_instance_profile_tags
  )
}