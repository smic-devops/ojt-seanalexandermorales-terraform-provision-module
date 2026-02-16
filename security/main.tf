resource "aws_security_group" "alb_sg" {
  name   = "${var.prefix}-alb-sg-module"
  vpc_id = var.vpc_id

  tags = {
    Environment    = "Sandbox"
    Resource_Types = "Instances Volumes Network_Interfaces"
  }
}

resource "aws_security_group_rule" "alb_ingress_from_http" {
  type = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_ingres_from_https" {
  type = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_egress_to_ec2" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.alb_sg.id
  source_security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group" "ec2_sg" {
  name   = "${var.prefix}-ec2-sg-module"
  vpc_id = var.vpc_id

  tags = {
    Environment    = "Sandbox"
    Resource_Types = "Instances Volumes Network_Interfaces"
  }
}

resource "aws_security_group_rule" "ec2_ingress_from_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "ec2_egress_to_all" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.ec2_sg.id
}

resource "aws_security_group" "rds_sg" {
  name   = "${var.prefix}-rds-sg-module"
  vpc_id = var.vpc_id

  tags = {
    Environment    = "Sandbox"
    Resource_Types = "Instances Volumes Network_Interfaces"
  }
}

resource "aws_security_group_rule" "rds_ingress_from_ec2" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_sg.id
  source_security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "rds_egress_to_all" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.rds_sg.id
}
