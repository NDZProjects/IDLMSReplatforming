output "lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = concat(aws_lb.this.*.id, [""])[0]
}

output "lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = concat(aws_lb.this.*.arn, [""])[0]
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = concat(aws_lb.this.*.dns_name, [""])[0]
}

output "lb_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch."
  value       = concat(aws_lb.this.*.arn_suffix, [""])[0]
}

output "lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = concat(aws_lb.this.*.zone_id, [""])[0]
}

output "lb_listener_arns" {
  description = "Map of listener ARNs by port"
  value       = { for k, v in aws_lb_listener.this : k => v.arn }
}


output "private_subnets_with_az" {
  description = "Selected private subnets with availability zones"
  value       = var.subnet_with_az
}

