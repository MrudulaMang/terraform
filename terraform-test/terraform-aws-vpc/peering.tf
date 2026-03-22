resource "aws_peering_connection" "default" {
    count = var.is_peering_required ? 1 : 0  # if true ; means 1

    # peer_owner_id = is requiered if it is different account
    peer_vpc_id = data.aws_vpc.default.id  # acceptor
    vpc_id = aws_vpc.main.id #requestor

    auto_accept = true # request connection to other vpc, coz in same account
 
    acceptor {
        allow_remote_vpc_dns_resolution =true
    }
    requestor {
        allow_remote_vpc_dns_resolution =true
    }

    tags = merge (var.peering_final_tags, 
        { 
          Name =  "${var.project}-${var.environment}-default"
        }
  )
}

resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0 # if true ; means 1
  route_table_id = aws_route_table.public.id
  destination_cidr_block = data.aws_vpc.default.cidr_block #-------------- default vpc-id
  vpc_peering_connection_id = aws_peering_connection.default[count.indiex].id   
}

resource "aws_route" "private_peering" {
  count = var.is_peering_required ? 1 : 0 # if true ; means 1
  route_table_id = aws_route_table.private.id
  destination_cidr_block = data.aws_vpc.default.cidr_block #-------------- default vpc-id
  vpc_peering_connection_id = aws_peering_connection.default[count.indiex].id   
}

resource "aws_route" "database_peering" {
  count = var.is_peering_required ? 1 : 0 # if true ; means 1
  route_table_id = aws_route_table.database.id
  destination_cidr_block = data.aws_vpc.default.cidr_block #-------------- default vpc-id
  vpc_peering_connection_id = aws_peering_connection.default[count.indiex].id   
}

resource "aws_route" "default_peering" {
  count = var.is_peering_required ? 1 : 0 # if true ; means 1
  route_table_id = data.aws_route_table.default.id
  destination_cidr_block = var.vpc_cidr #-------------- default vpc-id
  vpc_peering_connection_id = aws_peering_connection.default[count.indiex].id   
}
