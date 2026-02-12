variable "rds_sg_id" {
  description = "The security group ID of the RDS"
  type        = string
}

variable "username" {
  description = "Username of the database"
  type        = string
}

variable "password" {
  description = "Password of the database"
  type        = string
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The IDs of the private subnets used by the RDS subnet group"
}

variable "prefix" {
  type        = string
  description = "Prefix of the provisioned resources for the RDS"
}
