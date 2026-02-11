output "root_instance_private_dns" {
  description = "EC2 Instance Private DNS2"
  value       = module.itss-ojt-ec2.ec2_instance_private_dns
}