provider "aws" {
  region  = "${var.aws_region}"
}

data "aws_ecs_cluster" "module" {
  cluster_name = "${var.project}-${terraform.workspace}"
}

data "template_file" "module" {
  template = "${file("${var.ecs_service_task_definition_file}")}"
  vars {
    application_port    = "${var.ecs_service_task_application_port}"
    memory_limit        = "${var.ecs_service_task_container_memory_limit}"
    docker_image        = "${var.ecs_service_docker_image}"
    docker_image_tag    = "${var.ecs_service_docker_image_tag}"
    container_name      = "${var.ecs_service_docker_container_name}"
    logs_group_name     = "${var.project}-${var.environment}"
    aws_region          = "${var.aws_region}"

    domain_name         = "${var.domain_name}"

  }
}

resource "aws_ecs_task_definition" "module" {
  family                = "${var.project}-${var.environment}"
  container_definitions = "${data.template_file.module.rendered}"
}

resource "aws_ecs_service" "module" {
  name                               = "${var.project}-${var.environment}"
  cluster                            = "${data.aws_ecs_cluster.module.id}"
  task_definition                    = "${aws_ecs_task_definition.module.arn}"
  desired_count                      = "${var.ecs_service_size}"
  iam_role                           = "${var.ecs_service_iam_role_arn}"
  deployment_minimum_healthy_percent = 50

  ordered_placement_strategy {
    type  = "spread"
    field = "instanceId"
  }

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.module.arn}"
    container_name   = "${var.ecs_service_docker_container_name}"
    container_port   = "${var.ecs_service_task_application_port}"
  }

  lifecycle { create_before_destroy = true }
}
