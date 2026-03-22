module "ec2"{
    source = "../terraform-aws"
    project = var.project
    environment = var.environment
    ami_id = data.aws_ami.joindevops.id
    sg_ids = var.sg_ids
    instance_type = "t3.small"
    tags = {
        Name = "${var.project}-${var.environment}-${var.component}"
        Component = var.component
    }
}

/* can use datasources also*/