data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "var.tf_state_bucket"
    key    = "dev/vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}

