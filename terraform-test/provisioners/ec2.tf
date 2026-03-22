resource "aws_instance" "example"{
 ami           = "ami-0220d79f3f480ecf5"
 instance_type = "t3.micro"
 vpc_security_group_ids = [aws_security_group.allow_tls.id]

 #self is special variable
 provisioner "local_exec" {
  command = "echo ${self.public_id} > inventory.ini" #creates inventory.ini file and adds the info  
 }
 
 provisioner "local_exec" {
  #default commands will be executed at the time of creation
  command = "exit 1"  #wrong command terraform will exitdue  to error. when error occurs terraform delete the state. 
  on_failure= continue # terrraform continue executing even though there is failure to due to above command.
 }

 provisioner "local_exec" {
  command = "echo  script-2"
   }
 
 
 provisioner "local_exec" { 
  # explicitly mention destroy if to be executed during destroy
  when = destroy
  command = "echo 'deleting the instance'"  
  command = "echo > invetory.ini" #emptying the ini file
 }

 tags = {
    Name    = "provisioners-demo"
    Project = "roboshop"
 }
}

connection {
  type = "ssh"
  user = "ec2-user"
  password = "DevOps321" # 1:26 time session 33
  host = self.public_ip
}

provisioner "remote-exec" {
  inline = [
    "sudo dnf install nginx -y",
    "sudo systemctl start nginx"
  ]
}

provisioner "remote-exec" {
  inline = [
    "sudo systemctl stop nginx"
  ]
      when = destroy
}


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
