environment = "stage-ndz"
region      = "eu-west-1"
tf_state_bucket = "my-terraform-state-bckt4321"
log_group_tag_name    = "stage-ndz-DockerAPI"
ssm_param_name              = "/stage-ndz-cloudwatch/docker-config"
docker_log_group_name       = "/stage-ndz/docker/api"
ssm_tag_name                = "stage-ndz-docker-cloudwatch-config"

tf_state_region  = "eu-west-1"
