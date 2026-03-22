resource "aws_instance" "example"{
 ami           = "ami-0220d79f3f480ecf5"
 for_each = var.instances
 instance_type = each.value
 vpc_security_group_ids = [aws_security_group.allow_tls.id]
 
 tags = {
    Name    = each.key
    Project = "roboshop"
 }
}

/* #for_each only accepts:
    map
    set of strings
  list has index-based identity
  map has key-based identity
  for_each requires map or set
  list must be converted
*/

/* -----------commented multiple lines
resource "aws_instance" "example" {
  for_each = {
    app1 = "t2.micro"
    app2 = "t2.micro"
  }

  ami           = "ami-12345678"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
----terraform plans the above for-each as below
  resource "aws_instance" "example_app1" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "app1"
  }
}

resource "aws_instance" "example_app2" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "app2"
  }
} 
 -----------------------------

*/

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform" #this isfor aws account
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
    Name = "allow_all_terraform"
  }
}
