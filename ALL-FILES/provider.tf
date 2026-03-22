terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"  # Terrform AWS provider version
          }
  }
}
provider "aws" {
  region = "us-east-1"
}

/*
~> 6.0 means version
>= 6.0
< 7.0
*/