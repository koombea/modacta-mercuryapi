module "production" {
  source                              = "../../../terraform/service"
  ecs_service_size                    = 1
  ecs_service_docker_image_tag        = "${var.docker_image_tag}"
  domain_name                         = "${var.domain_name}"
  environment                         = "${terraform.workspace}"
  auth_token                          = "${var.auth_token}"


  # Base
  aws_region                         = "us-east-1"
  ecs_service_vpc_id                 = "${data.terraform_remote_state.base.vpc_id}"
  ecs_service_docker_image           = "${data.terraform_remote_state.base.ecr_url}"
  ecs_service_iam_role_arn           = "${data.terraform_remote_state.base.iam_service_role_arn}"
  ecs_service_alb_arn                = "${data.terraform_remote_state.base.alb_public_arn}"
  ecs_service_alb_https_listener_arn = "${data.terraform_remote_state.base.alb_https_public_listener_arn}"
  ecs_service_route53_domain         = "${var.domain_name}"
  ecs_service_route53_subdomains = ["mercury."]
}

output "docker_image_tag" {
  value = "${module.production.docker_image_tag}"
}
