variable "prefix" {
  type        = string
  description = "A naming prefix for resources"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the existing VPC"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The IDs of the public subnets for the ALB"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The IDs of the private subnets for the EC2"
}

variable "ami_id" {
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro" 
}

variable "ec2_sg_id" {
  type        = string
  default = ""
}