datasource "aws_ami" "joindevops"{
    most_recent = true
    owners = ""

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-practice"]
    }

    filter {
        name = "root-device-type"
        values = "ebs"
    }

    filter {
        name = "virtualization-type"
        values = "hvm"
    }

}

/*
data "<PROVIDER>_<RESOURCE_TYPE>" "<LOCAL_NAME>" {
  argument1 = value
  argument2 = value
}
*/
