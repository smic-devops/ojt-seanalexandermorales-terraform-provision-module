# Application Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "${var.prefix}-alb-module"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnet_ids

  tags = {
    Environment = "Sandbox"
  }
}

# Target Group (TG)
resource "aws_lb_target_group" "tg" {
  name     = "${var.prefix}-alb-tg-module"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Environment    = "Sandbox"
    Resource_Types = "Instances Volumes Network_Interfaces"
  }
}

# ALB Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  tags = {
    Environment    = "Sandbox"
    Resource_Types = "Instances Volumes Network_Interfaces"
  }
}