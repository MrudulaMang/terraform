resource "aws_instance" "mongodb" {
    name = "${var.project}-${var.environment}-mongodb"
    instance_type = "t3.micro"
    subnet_id = local.database_subnet_id
    vpc_security_ids = local.database_sg_id

  
tags = merge (
        {
            Name ="${var.project}-${var.environment}-mongodb" 
        },
        local.common_tags
    )
}

resource terraform_data "bootstrap"{
    trigger_replace {
        aws_instance.mongodb.id #triggers when mongodb_id changes meaning when new instance is created
    }

    connection {
        type = "ssh" 
        user = "ec2-user"
        password = "DevOps321"
        host = aws_instance.mongodb.private_ip
    }

    # timestamp from sessiom TFS =22:26
    provisioner "file"{
        source = "bootstrap.sh"        # copy file from here
        destination = "/tmp/bootstrap" # to mongodb instance
    }


    provisioner "remote_exec" { 
        inline = [ 
            "chmod +x /tmp/bootstrap.sh" ,
            "sudo sh /tmp/bootstrap.sh"
        ]
    }
}