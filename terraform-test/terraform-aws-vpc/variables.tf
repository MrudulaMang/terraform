variable "project" {
    type = string
}
variable "environment" {
    type = string
    validation {
        condition = contains(["dev","qa","prod","uat"],var.environment)
        error_message = "Environments should be dev/qa/uat or prod"
    }
}

variable "vpc_tags" {
    type = map
    default = {}
}
variable "igw_tags" {
    type = map
    default = {}
}

variable "public_subntet_tags" {
    type = map
    default = {}
}
variable "private_subnet_tags" {
    type = map
    default = {}
}
variable "database_subnet_tags" {
    type = map
    default = {}
}

variable "public_subnet_cidrs" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "private_subnet_cidrs" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "database_subnet_cidrs" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "public_route_tags" {
    type = map
    default = {}
}
variable "private_route_tags" {
    type = map
    default = {}
}
variable "database_route_tags" {
    type = map
    default = {}
}

variable "eip_tags" {
    type = map
    default = {}
}
variable "nat_tags" {
    type = map
    default = {}
}

variable "is_peering_required" {
    default = false
    type = bool
}

