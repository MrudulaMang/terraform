terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"  # Terrform AWS provider version
          }
  }

backend "s3" {
  bucket = "terra-state-88s" 
  key = "remote-state.tstate" # can give any keyname and extension
  region = "us-east-1"
  encrypt = true
  use_lockfile = true # 43:00 for locking state file while applyying, previous version used to create dynamo db table for native locking now noneed
} 
}
# when terrform init is used terraform will understand that state file shouldbe store in s3

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}



