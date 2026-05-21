# ==============================================================================
# Basic Example - Instana Agent EC2 Module
# ==============================================================================
#
# This example demonstrates the minimal configuration required to deploy
# Instana agents on EC2 instances.
#
# ==============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "instana_agent" {
  source = "../.."

  # Required: Network Configuration
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  # Required: Instana Configuration
  instana_agent_key = var.instana_agent_key
  instana_endpoint  = var.instana_endpoint

  # Optional: Basic Configuration
  name_prefix = var.name_prefix

}