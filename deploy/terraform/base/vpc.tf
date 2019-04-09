provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source              = "git::git@github.com:koombea/terraform_modules//aws_vpc?ref=a875220e81e21eadbef0871043531d233dfb1752"
  project             = "${var.project}"
  cidr_block          = "10.0.0.0/16"
  public_subnets = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]

}
