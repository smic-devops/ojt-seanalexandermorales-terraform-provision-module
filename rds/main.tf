resource "aws_db_subnet_group" "rds_subnet" {
  name       = "${var.prefix}-rds-subnet-group-module"
  subnet_ids = var.private_subnet_ids

  tags = {
    Environment    = "Sandbox"
    Resource_Types = "Instances Volumes Network_Interfaces"
  }
}

resource "aws_db_instance" "default" {
  vpc_security_group_ids = [var.rds_sg_id]
  allocated_storage    = 10
  db_name              = "mydb"
  identifier           = "${var.prefix}-rds-instance-module"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
}