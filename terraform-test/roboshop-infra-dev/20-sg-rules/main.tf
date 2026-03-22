

resource "aws_security_group_rule" "bastian_internet" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #cidr_blocks      = "0.0.0.0/0"
  cidr_blocks       = local.my_ip # instead of internet we gave my lappy id
  security_group_id = local.bastian_sg_id
}

resource "aws_security_group_rule" "mongodb_bastian" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #where traffic is coming from
  source_security_group_id = local.bastian_sg_id
  security_group_id = local.mongodb_sg_id
}

