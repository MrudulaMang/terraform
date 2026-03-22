varible "name" {
  type = string
  default = "locals"
}

varible "environemnt"{
  type = string
  default = "dev"
}


variable "ec2_tags"{
    default = {
        Name = "locals-demo"
        Environemnt = "prod"

    }

variable "sg_tags"{
     default = {
        Name = "locals-demo"
     }
}

}