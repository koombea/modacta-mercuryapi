output "iam_service_role_arn" {
  value = "${module.production_base.iam_service_role_arn}"
}

output "alb_public_arn" {
  value = "${module.production_base.alb_public_arn}"
}

output "alb_https_public_listener_arn" {
  value = "${module.production_base.alb_https_public_listener_arn}"
}

output "vpc_id" {
  value = "${module.production_base.vpc_id}"
}

output "ecs_cluster_name" {
  value = "${module.production_base.ecs_cluster_name}"
}

output "ecr_url" {
  value = "${module.production_base.ecr_url}"
}

output "aws_region" {
  value = "${module.production_base.aws_region}"
}
