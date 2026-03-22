datasource "aws_ami" "joindevops"{
    most_recent = true
    owners =["973714476881"] #AWS account ID of whoever published the AMI.

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-practice"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

}

/*
data "<PROVIDER>_<RESOURCE_TYPE>" "<LOCAL_NAME>" {
  argument1 = value
  argument2 = value
}
*/

data "aws_instance" "terraform_instance" {
    instance_id = "073y9dn"

 /* use filter only when multiple instances are to be filtered
    filter {
        name = "instance-ids"
        values = [""]

    }
}

/* to get zone id
data "aws_route53_zone" "main" {
  name = "devopsgeek"
}

output "zone_id" {
  value = data.aws_route53_zone.main.zone_id
}

*/