data "aws_alb" "module" {
  arn = "${var.ecs_service_alb_arn}"
}

data "aws_route53_zone" "selected" {
  name = "${var.ecs_service_route53_domain}."
}

resource "aws_route53_record" "module" {
  count   = "${length(var.ecs_service_route53_subdomains)}"
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${element(var.ecs_service_route53_subdomains, count.index)}${var.ecs_service_route53_domain}"
  type    = "A"
  alias {
    name                   = "${data.aws_alb.module.dns_name}"
    zone_id                = "${data.aws_alb.module.zone_id}"
    evaluate_target_health = true
  }
}
