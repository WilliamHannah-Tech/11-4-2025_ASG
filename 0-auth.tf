terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = "eu-west-2"
  profile = "default"

  # Default tags are applied to all resources created by this provider
  default_tags {
    tags = {
      Project     = "vpc-demo"
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}

