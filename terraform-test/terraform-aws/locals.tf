locals {
    common_tags = {
        Project = "roboshop"
        Enviroment = var.environment
        Terrform = "true"
    }
    ec2_final_tags = merge(
        local.common_tags,
        var.tags
    )
}
