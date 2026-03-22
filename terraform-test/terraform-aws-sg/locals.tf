locals {
    common_tags = {
        Project = var.project
        Enviroment = var.environment
        Terraform = "true"
    }
}