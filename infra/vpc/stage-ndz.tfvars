environment = "stage-ndz"
region      = "eu-west-1"
ec2_ssm_profile_name = "stage--ndz-ec2_ssm_profile"
ec2_ssm_role_name    = "ec2_ssm_role-stage--ndz"
tf_state_bucket      = "my-terraform-state-bckt4321"
ami_id               = "ami-01f23391a59163da9"
docker_artifact_bucket = "idlms-website-built-artifact"
app_ports = [4000, 4001, 4002]
enable_dns_support   = true
enable_dns_hostnames = true
vpc_name             = "stage-ndz-idlms-vpc"
vpc_cidr             = "10.122.0.0/16"

common_tags = {
  "Owner"      = "IDLMS"
  "Project"    = "Terraform VPC"
  "Environment"= "stage-ndz"
}

internet_gateway_name = "stage-ndz-idlms-igw"
total_nat_gateway_required = 3
eip_for_nat_gateway_name   = "stage-ndz-idlms-eip"
nat_gateway_name           = "stage-ndz-idlms-ngw"

public_subnets = {
  cidrs_blocks         = ["10.122.1.0/24", "10.122.2.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  subnets_name_prefix  = "stage-ndz-public"
  route_table_name     = "stage-ndz-public"
  map_public_ip_on_launch = true
  routes               = []
}

private_subnets = {
  cidrs_blocks         = ["10.122.10.0/24", "10.122.20.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  subnets_name_prefix  = "stage-ndz-private"
  route_table_name     = "stage-ndz-private"
  routes               = []
}

private_lb_subnets = {
  cidrs_blocks         = ["10.121.15.0/26", "10.121.15.64/26", "10.121.15.128/26"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets_name_prefix  = "stage-ndz-lb"
  route_table_name     = "stage-ndz-lb"
  routes               = []
}

private_app_subnets = {
  cidrs_blocks         = ["10.121.16.0/22", "10.121.20.0/22", "10.121.24.0/22"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets_name_prefix  = "stage-ndz-app"
  route_table_name     = "stage-ndz-app"
  routes               = []
}

private_data_subnets = {
  cidrs_blocks         = ["10.121.40.0/24", "10.121.41.0/24", "10.121.42.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets_name_prefix  = "stage-ndz-data"
  route_table_name     = "stage-ndzdata"
  routes               = []
  is_public            = true
}

private_services_subnets = {
  cidrs_blocks         = ["10.121.254.0/26", "10.121.254.64/26", "10.121.254.128/26"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets_name_prefix  = "stage-ndz-service"
  route_table_name     = "stage-ndz-service"
  routes               = []
}

ec2_tags = {
  Name = "Backend API IDLMS-stage-ndz"
}

instance_type = "t3.micro"
