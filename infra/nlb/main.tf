module "group_1_nlb" {
  source               = "../../../terraform-modules"

  name                 = "group-1-nlb"
  internal             = var.internal
  load_balancer_type   = var.load_balancer_type
  vpc_id               = data.terraform_remote_state.vpc.outputs.vpc_id
  target_ips           = [data.terraform_remote_state.vpc.outputs.ec2_private_ip]
  target_port          = var.target_port

  # Use PUBLIC subnets now
  subnet_mapping = [
    for subnet_id in data.terraform_remote_state.vpc.outputs.private_subnets_ids :
    { subnet_id = subnet_id }
  ]

  create_sg     = var.lb_create_sg
  sg_name       = "group-1-nlb-sg"
  ingress_roles = local.lb_sg_ingress_roles
  egress_roles  = var.lb_egress_roles

  tags = var.common_tags
}

