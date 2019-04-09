module "sg_ec2" {
  source              = "git::git@github.com:koombea/terraform_modules//aws_sg?ref=a875220e81e21eadbef0871043531d233dfb1752"
  project             = "${var.project}"
  suffix_name      = "-ssh"
  admin_source_ips = ["0.0.0.0/0"]
  vpc_id           = "${module.vpc.id}"
}

module "sg_alb" {
  source          = "git::git@github.com:koombea/terraform_modules//aws_sg?ref=a875220e81e21eadbef0871043531d233dfb1752"
  project         = "${var.project}"
  suffix_name  = "-http"
  public_ports = ["80", "443"]
  vpc_id       = "${module.vpc.id}"
}
