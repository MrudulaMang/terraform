output "ami_id" {
    value = data.aws_ami.joindevops.id
}

# data.<type>.<name>.<attribute>

output "aws instance" {
    value = data.aws_terraform_instance
}

# data.<type>.<name>.<attribute>