locals {
    common_tags ={
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    vpc_final_tags = {
        merge (
     local.common_tags,
        {
          Name = "{$var.project-$var.environment}"
        } 
    ,var.vpc_tags)
    }

    igw_final_tags = {
        merge (
             local.common_tags,
             {
                Name = "{$var.project-$var.environment}"
              } 
         ,var.igw_tags)
    }   

    az_names = slice(data.aws_availability_zones.available.names, 0, 2)
    
    public_subnet_final_tags = {
        merge (
            local.common_tags,
            var.public_subnet_tags    
        )
    }
    private_subnet_final_tags = {
            merge (
                local.common_tags,
                var.private_subnet_tags    
            )
        }
    database_subnet_final_tags = {
            merge (
                local.common_tags,
                var.database_subnet_tags    
            )
        }

    public_route_final_tags = {
            merge (
                local.common_tags,
                var.public_route_tags    
            )
        }
    private_route_final_tags = {
            merge (
                local.common_tags,
                var.private_route_tags    
            )
        }
    database_route_final_tags = {
            merge (
                local.common_tags,
                var.database_route_tags    
            )
        }
    eip_final_tags = {
            merge (
                local.common_tags,
                var.eip_tags    
            )
        }

    nat_final_tags = {
            merge (
                local.common_tags,
                var.eip_tags    
            )
        }
}