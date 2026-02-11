variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The IDs of the public subnets for the ALB"
}

variable "prefix" {
  description = "Prefix of the provisioned resources for the ALB"
  type        = string
}

variable "alb_sg_id" {
  description = "The security group ID of the ALB instance"
  type        = string
}
