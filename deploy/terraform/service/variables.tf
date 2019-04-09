# Initial config
variable "project"          { default = "mercury" }
variable "environment"      {  }
variable "aws_region"       {  }

# Application service
variable "ecs_service_vpc_id"                 {  }
variable "ecs_service_size"                   { default = 1        }
variable "ecs_service_iam_role_arn"           {  }
variable "ecs_service_alb_arn"                {  }
variable "ecs_service_alb_https_listener_arn" {  }
variable "ecs_service_route53_domain"         {  }
variable "ecs_service_route53_subdomains"     { default = [] }
variable "ecs_service_docker_image"           {  }
variable "ecs_service_docker_image_tag"       {  }
variable "ecs_service_docker_container_name"  { default = "api" }

# Target group
variable "ecs_service_target_group_timeout"    { default = 3   }
variable "ecs_service_target_group_interval"   { default = 5   }
variable "ecs_service_target_group_unhealthy"  { default = 5   }
variable "ecs_service_target_group_healthy"    { default = 5   }
variable "ecs_service_target_group_path"       { default = "/" }
variable "ecs_service_target_group_priorities" { default = ["100"]  }
variable "ecs_service_target_group_status"     { default = 200 }

# ECS Tasks config
variable "ecs_service_task_container_memory_limit" { default = 256 }
variable "ecs_service_task_application_port"       { default = 3000 }
variable "ecs_service_task_definition_file"        { default = "../../../terraform/service/mercuryapi.task.json" }


# Mercury-app
variable "domain_name" {}
variable "auth_token" {}

