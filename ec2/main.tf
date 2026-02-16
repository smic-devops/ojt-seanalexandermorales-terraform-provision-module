# EC2 Instance
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = <<-EOT
    #!/bin/bash
    sudo yum update -y

    sudo yum install -y amazon-ssm-agent

    sudo systemctl enable amazon-ssm-agent
    sudo systemctl start amazon-ssm-agent
  EOT

  tags = {
    Name            = "${var.prefix}-ec2-module"
    Environment     = "Sandbox"
    backup          = "no"
    Schedule        = "running"
    Patch           = "No"
    Resource_Types  = "Instances Volumes Network_Interfaces"
  }
}

# Register EC2 with the TG
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = var.tg_arn
  target_id        = aws_instance.web.id
  port             = 80
}