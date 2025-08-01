data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_bucket
    key    = "${var.env_name}/vpc/terraform.tfstate"
    region = var.tf_state_region
  }
}

