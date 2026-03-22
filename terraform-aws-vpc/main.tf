resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = vpc_final_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = igw_final_tags
}

resource "aws_subnet" "public" {

  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true #gives public ip to aws_subnet
  
  tags = merge (var.public_subnet_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"public"-local.az_names[count.index]}"
        }
  )
}

resource "aws_subnet" "private" {

  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  
  tags = merge (var.private_subnet_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"private"-local.az_names[count.index]}"
        }
  )
}

resource "aws_subnet" "database" {

  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  
  tags = merge (var.database_subnet_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"database"-local.az_names[count.index]}"
        }
  )
}

resource "aws_route_table" "public"{
  vpc_id = aws_vpc.main.id

   tags = merge (var.public_route_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"public"}"
        }
  )

}

resource "aws_route_table" "private"{
  vpc_id = aws_vpc.main.id

   tags = merge (var.private_route_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"private"}"
        }
  )
}

resource "aws_route_table" "database"{
  vpc_id = aws_vpc.main.id

   tags = merge (var.database_route_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"database"}"
        }
  )
}

resource "aws_route" "public {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_eip" "main" {
  domain = "vpc"

     tags = merge (var.eip_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"eip"}"
        }
     )
}

resource "aws_nat_gateway" "main" {
  allocation _id = aws_eip.main.id
  subnet_id = aws_subnet.public[0].id # us-east-1a
   tags = merge (var.nat_final_tags, 
        { 
          Name =  "{$var.project-$var.environment-"nat"}"
        }
     )
  depends_on = [aws_internet_gateway.main] # writing coz there is no dependecy of igw in the block
  }

resource "aws_route" "private" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.main
}

resource "aws_route" "database"{
  route_table_id = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "public" {
  count = length (var.public_subnet_cidrs)
  subnet_id = aws_subnet.public_subnet_cidrs[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length (var.private_subnet_cidrs)
  subnet_id = aws_subnet.private_subnet_cidrs[count.index]
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count = length (var.database_subnet_cidrs)
  subnet_id = aws_subnet.database_subnet_cidrs[count.index]
  route_table_id = aws_route_table.database.id
}




