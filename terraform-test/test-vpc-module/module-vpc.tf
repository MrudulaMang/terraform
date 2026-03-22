module "vpc" {
    source = "git::https://github.com/daws-88s/terraform-aws-vpc.git?ref=main"
    project = var.Project
    environment = var.environment
    vpc_cidr  = var.vpc_cidr
    is_peering_required = true 
}