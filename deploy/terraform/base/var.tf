variable "aws_region"        { default = "us-east-1"    }
variable "project"           { default = "mercury"      }
variable "environment"       {                          }
variable "domain"            {                          }
variable "ecs_acm_arn"       {                          }
variable "ecs_asg_index"     { default = 00             }
variable "ecs_asg_min"       { default = "1"            }
variable "ecs_asg_max"       { default = "3"            }
variable "ecs_asg_size"      { default = "1"            }
variable "ecs_instance_type" { default = "t2.medium"    }
variable "ecs_dev_users" {}
