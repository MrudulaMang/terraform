data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_vpc" "default" {
    default = true
}

data "aws_route_table" "default" {
    vpc_id = data.aws_vpc.default.id #"Look for a route table inside this specific VPC."
    filter = {
        name = "association.main"
    }
}