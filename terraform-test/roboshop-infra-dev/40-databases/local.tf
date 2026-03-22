locals {
    common_tags {
        Project = var.project
        Environment = var.environment
        Terraform = true
    },
    vpc_id = data.joindevops.vpc_id
    database_subnet_id = split(",",data.aws_ssm_parameter.database_subnet_ids.value)[0]
    database_sg_id = data.aws_ssm_parameter.value   
}