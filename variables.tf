variable "prefix" {
  type        = string
  description = "A naming prefix for resources"
  default = "itss-ojt-morales"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the existing VPC"
  default = "vpc-05596861f4ecffdeb"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The IDs of the public subnets for the ALB"
  default = [
    "subnet-02f95b7899e8bed30", # itss-ops az1 public
    "subnet-09c8dbaa942884f5d"  # itss-ops az2 public
  ]
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The IDs of the private subnets for the EC2"
  default = [
    "subnet-0ee426ba08e9643d9", # itss-ops az1 private
    "subnet-095cdc7b816291369"  # itss-ops az2 private
  ]
}

variable "ami_id" {
  type        = string
  default = "ami-0249e9b9816d90e03"
}

variable "instance_type" {
  type    = string
  default = "t3.micro" 
}

variable "ec2_sg_id" {
  type        = string
  description = "The ID of the EC2 Security Group"
  default = ""
}

variable "username" {
  type        = string
  description = "The username of the database"
  default = "itss-ojt-morales"
}

variable "password" {
  type        = string
  description = "The password of the database"
  default = "1a2s3d4f"
}