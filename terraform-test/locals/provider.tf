terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"  # Terrform AWS provider version
          }
  }

backend "s3" {
  bucket = "locals-state-88s" 
  key = "locals-demo.tstate" # can give any keyname and extension should be unique
  region = "us-east-1"
  encrypt = true
  use_lockfile = true 
  }
}
# when terrform init is used terraform will understand that state file shouldbe store in s3

# Configure the AWS Provider region
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}