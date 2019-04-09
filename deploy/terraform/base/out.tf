
output "iam_service_role_arn" {
  value = "${module.ecs.iam_service_role_arn}"
}

output "iam_event_role_arn" {
  value = "${module.ecs.iam_event_role_arn}"
}

output "alb_public_arn" {
  value = "${module.ecs.alb_public_arn}"
}

output "alb_https_public_listener_arn" {
  value = "${module.ecs.alb_https_public_listener_arn}"
}

output "vpc_id" {
  value = "${module.vpc.id}"
}

output "ecr_url" {
  value = "${module.ecs.ecr_url}"
}

output "aws_region" {
  value = "${module.ecs.aws_region}"
}

output "ecs_cluster_name" {
  value = "${module.ecs.cluster_name}"
}

