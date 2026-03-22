resource "aws_instance" "example"{
 ami           = data.aws_ami.joindevops.id
 instance_type = var.instance_type
 subnet_id              = aws_subnet.public.id
 vpc_security_group_ids = [aws_security_group.allow_tls.id]
 
 tags = {
    Name    = "${var.project}-${var.environment}"
    Project = var.project
    Enviroment = var.environment
     }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform-${var.environment}" #this is for aws account
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_vpc.myvpc.id

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
    Name = "allow_all_terraform-${var.environment}"
  }
}
