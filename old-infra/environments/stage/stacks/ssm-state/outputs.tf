output "lb_arn"       { value = data.aws_ssm_parameter.lb_arn.value }
output "lb_dns_name"  { value = data.aws_ssm_parameter.lb_dns_name.value }
output "lb_zone_id"   { value = data.aws_ssm_parameter.lb_zone_id.value }
output "listener_map" { value = local.ls_map }
output "tg_map"       { value = local.tg_map }
