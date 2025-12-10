###########################
#  Local: auto-detect TG protocol
###########################
locals {
  # tg_protocol = var.container_port == 443 ? "HTTPS" : "HTTP"   # <-- NEW: dynamic TG protocol
   tg_protocol = var.app_port == 443 ? "HTTPS" : "HTTP"   # <-- NEW: dynamic TG protocol
}

resource "aws_lb" "main" {
  name               = "${var.app_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  # subnets            = aws_subnet.public[*].id
  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.app_name}-${var.environment}-alb"
  }
 
}

resource "aws_lb_target_group" "main" {
  name        = "${var.app_name}-${var.environment}-tg"
  port        = var.app_port                      # <-- MODIFIED: dynamic port
 # protocol    = "HTTP"
  protocol    = local.tg_protocol                     # <-- MODIFIED: dynamic protocol
  # vpc_id      = aws_vpc.main.id
  vpc_id = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
  #  path                = "/"
   # protocol            = "HTTP"
    protocol            = local.tg_protocol            # <-- FIXED
    path                = "/healthcheck"               # <-- FIXED
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name = "${var.app_name}-${var.environment}-tg"
  }
  
}


# HTTP listener when SSL is disabled (direct forwarding)
resource "aws_lb_listener" "http_forward" {
  count = var.enable_ssl ? 0 : 1    

  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}


///commented by sowjanya --not required below ones for our exiting environment

# HTTP listener when SSL is enabled (redirect to HTTPS)
resource "aws_lb_listener" "http_redirect" {
  count = var.enable_ssl ? 1 : 0

  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# HTTPS listener - conditionally created
resource "aws_lb_listener" "https" {
  count = var.enable_ssl ? 1 : 0     # <-- NEW: enable_ssl toggle

  load_balancer_arn = aws_lb.main.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

