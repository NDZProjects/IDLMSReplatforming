terraform {
  backend "s3" {
    bucket = "my-terraform-state-bckt43"
    key    = "dev/nlb/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

