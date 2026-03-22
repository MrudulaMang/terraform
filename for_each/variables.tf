variable "instances" {
    type = map
    default = {
        mongodb = "t3.small"
        mysql = "t3.small"
        catalouge = "t3.micro"
    }
}

# zoneid
variable "zone_id" {
     default = "Z0520348QRYMUC2F9PWQ"
}

# domain_name
variable "domain_name" {
     default = "devopsgeek.online"
}
