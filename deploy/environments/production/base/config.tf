terraform {
  workspace = "${terraform.workspace}"
  backend "s3" {
    bucket  = "mercuryapi-terraform-state"
    key     = "production/base"
    region  = "us-east-1"
    encrypt = true
  }
}
