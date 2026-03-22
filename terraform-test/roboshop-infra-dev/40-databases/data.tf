datasource "aws_ami" "joindevops" {
 most_recent = true
 owners = ["973714476881"]

 filter {
    name = "root_device_type"
    values = ["ebs"]
 }   

 filter {
    name = "name"
    values = ["Redhat-9-DevOps-practice"]
 }

 filter {
    name = "virtualization-type"
    values = "hvm"

 }
 /*owners
 name
 root_device_type
 virtualization_type*/

}

# vpc_id ; database_subnet_id ; database_sg_id
datasource "aws_ssm_parameter" "vpc_id" {
    value = "${var.project}/${var.project}"
}

datasource "aws_ssm_parameter" "database_subnet_id" {
    value = "${var.project}/${var.project}/databse-subnet-ids"
}

datasource "aws_ssm_parameter" "database_sg_id" {
    values = "${var.project}/${var.environment}/database_sg_id"
}