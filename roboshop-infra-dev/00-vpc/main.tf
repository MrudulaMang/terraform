# we are creating vpc, subnets and peering
# storing vpc_id in ssm parameter store

module "vpc" {
    #source = "git::https://github.com/daws-88s/terraform-aws-vpc.git?ref=main"
    source = "../../terraform-aws-vpc"
    project = var.project
    environment = var.environment
    vpc_cidr  = var.vpc_cidr
    is_peering_required = true 
}