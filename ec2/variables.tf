variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "subnet_id" {
  type        = string
  description = "The specific subnet ID for the EC2"
}

variable "ami_id" {
  type        = string
}

variable "prefix" {
  description = "Prefix of the provisioned resources for the EC2"
  type        = string
}

variable "ec2_sg_id" {
  description = "The security group ID of the EC2 instance"
  type        = string
  default = null
}

variable "tg_arn" { 
  description = "ARN of the ALB Target Group" 
}