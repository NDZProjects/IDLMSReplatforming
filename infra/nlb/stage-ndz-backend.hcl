bucket         = "my-terraform-state-bckt4321"
key            = "stage-ndz/nlb/terraform.tfstate"
region         = "eu-west-1"
encrypt        = true
dynamodb_table = "terraform-locks"
