
module "api_gateway" {
  source               = "../terraform-modules/rest-api"
  region               = var.region
  environment          = var.environment
  stage_name           = var.stage_name
  log_retention_days   = var.log_retention_days
  api_description      = var.api_description
  binary_media_types   = var.binary_media_types
  vpc_link_target_arns = local.vpc_link_target_arns
  nlb_dns_name         = local.nlb_dns_name
  common_tags          = var.common_tags
}

provider "aws" {
  region = var.region
}
