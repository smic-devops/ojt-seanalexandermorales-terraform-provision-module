variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "prefix" {
  description = "Prefix of the provisioned resources for the EC2"
  type        = string
}
