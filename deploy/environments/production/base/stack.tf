module "production_base" {
  source       = "../../../terraform/base"
  environment  = "${terraform.workspace}"
  domain       = "mercury.modacta.koombea.io"
  ecs_acm_arn  = "arn:aws:acm:us-east-1:354627820286:certificate/8ecaffc9-0837-4270-876b-e00297be2530"
  ecs_dev_users = ["ccarop", "AndrewsHerrera", "josekoombea"]
}
