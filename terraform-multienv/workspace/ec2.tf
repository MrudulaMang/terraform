resource "aws_instance" "example"{
 ami           = local.ami_id
 instance_type = lookup(var.instance_type, local.environment)
 vpc_security_group_ids = [aws_security_group.allow_tls.id]
 
 tags = {
    Name    = "${var.project}-${local.environment}"
    Project = var.project
    Enviroment = local.environment
     }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform-S{local.environment}" #this is for aws account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all protocol
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "allow_all_terraform-${local.environment}"
  }
}
