resource "aws_alb_listener_rule" "https_rule" {
  count        = "${length(var.ecs_service_route53_subdomains)}"
  listener_arn = "${var.ecs_service_alb_https_listener_arn}"
  priority     = "${element(var.ecs_service_target_group_priorities, count.index)}"
  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.module.arn}"
  }
  condition {
    field  = "host-header"
    values = ["${element(var.ecs_service_route53_subdomains, count.index)}${var.ecs_service_route53_domain}"]
  }
}
