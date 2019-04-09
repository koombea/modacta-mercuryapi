resource "aws_alb_target_group" "module" {
  name                 = "${var.project}-${var.environment}"
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 15
  vpc_id               = "${var.ecs_service_vpc_id}"

  health_check {
    path                = "${var.ecs_service_target_group_path}"
    matcher             = "${var.ecs_service_target_group_status}"
    timeout             = "${var.ecs_service_target_group_timeout}"
    interval            = "${var.ecs_service_target_group_interval}"
    healthy_threshold   = "${var.ecs_service_target_group_healthy}"
    unhealthy_threshold = "${var.ecs_service_target_group_unhealthy}"
  }
}
