output "roboshop_instances" {
    value = aws_instance.example[*].public_ip
    description = "description"
}

# aws_instance.example[*].public_ip 
# collects the public_ip attribute from all EC2 instances created using count and returns them as a list.

# value = aws_instance.example --- gives every info of all the instances created
