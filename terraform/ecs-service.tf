
resource "aws_ecs_service" "main" {



  name            = "${var.app_name}-${var.environment}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
##
  network_configuration {

     subnets         = var.private_subnet_ids
     security_groups = concat([aws_security_group.ecs.id],[aws_security_group.db.id],var.recupe_dev_app_sg)  # <-- MODIFIED: attach Recupe Dev Application from variable
   
          assign_public_ip = false   #  Set to true if ALB is public
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "${var.app_name}-${var.environment}"
    container_port   = var.app_port      # <-- MODIFIED: dynamic container port
  }

  health_check_grace_period_seconds = 60
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  tags = {
    Name = "${var.app_name}-${var.environment}-service"
  }

 depends_on = [
    aws_lb.main,
    aws_lb_target_group.main,
    aws_lb_listener.http_forward,
    aws_ecs_task_definition.main
  ]

}