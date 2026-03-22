# we are creating vpc, subnets and peering
# storing vpd_id in ssm parameter store

module "vpc" {
    source = "../../terraform-aws-vpc"
    project = var.Project
    environment = var.environment
    vpc_cidr  = var.vpc_cidr
    is_peering_required = true 
}