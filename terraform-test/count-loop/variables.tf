variable "instances" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
}

# zoneid
variable "zone_id" {
     default = "Z0520348QRYMUC2F9PWQ" #got from aws-r53-devopsgeek-hostedzone-id
}

# domain_name
variable "domain_name" {
     default = "devopsgeek.online"
}

# list datatype : output is as is and maitains the order
variable "fruits" {
    type=list(string)
    default = ["apple","banana","apple","orange"]
}


# set datatype : duplicates will be removed in the output
variable "fruits_set" {
    type=set(string)
    default = ["apple","banana","apple","orange"]
}