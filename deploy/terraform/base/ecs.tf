module "ecs" {
  source                  = "git::git@github.com:koombea/terraform_modules//aws_ecs?ref=9de02f2bce3db03880cacbc2c5b35ee159ac9e68"
  project                 = "${var.project}"
  aws_region              = "${var.aws_region}"
  
  vpc_ec2_subnet_ids      = "${module.vpc.public_subnet_ids}"
  ec2_key_name            = "carlos.caro.koombea"
  ec2_admin_users         = ["pabloxco", "AndrewsHerrera", "ccarop"]
  ec2_dev_users           = ["pabloxco", "AndrewsHerrera", "ccarop"]
  vpc_public_subnet_ids   = "${module.vpc.public_subnet_ids}"
  ec2_security_group_ids  = ["${module.sg_ec2.id}"]
  alb_public_security_group_ids  = ["${module.sg_alb.id}"]

  acm_arn                 = "${var.ecs_acm_arn}"
  ec2_instance_type       = "${var.ecs_instance_type}"
  cloudwatch_logs_retention_days = 30

  asg_index           = "${var.ecs_asg_index}"
  asg_min_size        = "${var.ecs_asg_min}"
  asg_max_size        = "${var.ecs_asg_max}"
  asg_size            = "${var.ecs_asg_size}"
  asg_index           = "01"

  ecr                 = true

}

