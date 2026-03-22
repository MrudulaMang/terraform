resource "aws_security_group" "main" {
    name = "${var.project}-${var.environment}-${var.sg_name}"
    description = "Allow TLS inbound traffic for ${var.project} in ${var.environment} for component ${var.sg_desc}"
    vpc_id = "${var.vpc_id}"
    
    egress {
        from_port = 0 from any # from lowest/any port
        to_port   = 0 # all/any port - ignored when protocol -1
        protocol  = "-1" # all protocols
        cidr_blocks = ["0.0.0.0/0"] #instance can send traffic to ANY IP
    }

    /*
        #default egress rule: allow all outbound traffic
        Most production systems keep open egress because servers need to:
            download packages
            call APIs
            connect to databases
            reach AWS services
        But high-security environments restrict egress like:
            Allow only:
                443 → internt
                5432 → database
    */    
            
    tags = merge (
        var.sg_tags, #keep it first coz if use give name tag we can replace by the name we gave
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-${var.sg_name}"
        }
        

    )

    }
