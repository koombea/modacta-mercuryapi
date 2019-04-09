terraform {
  workspace = "${terraform.workspace}"
  backend "s3" {
    bucket  = "mercuryapi-terraform-state"
    key     = "production/service"
    region  = "us-east-1"
    encrypt = true
  }
}

# Base outputs
data "terraform_remote_state" "base" {
  workspace = "${terraform.workspace}"
  backend = "s3"

  config {
    bucket = "mercuryapi-terraform-state"
    key    = "production/base"
    region = "us-east-1"
  }
}
