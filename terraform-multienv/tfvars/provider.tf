terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"  # Terrform AWS provider version
          }
  }

backend "s3" {
} 
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myVpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}


