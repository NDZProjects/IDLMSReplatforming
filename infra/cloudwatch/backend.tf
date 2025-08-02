terraform {
  backend "s3" {
   bucket = "my-terraform-state-bckt4321"
    key    = "stage-ndz/cloudwatch/terraform.tfstate"
    region = "eu-west-1"
  }
}
