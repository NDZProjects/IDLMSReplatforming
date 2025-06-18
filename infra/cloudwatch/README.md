CloudWatch Setup for Docker API Logs
This Terraform configuration sets up AWS CloudWatch logging for Docker containers running on EC2 instances. It includes:

CloudWatch Log Group for Docker logs

SSM Parameter storing the CloudWatch Agent configuration

Required S3 Bucket variables (for compatibility, even if NLB is not ready)

📁 Directory Structure
infra/cloudwatch/
├── main.tf                 # Creates CloudWatch Log Group
├── ssm.tf                  # Stores CloudWatch Agent config in SSM
├── variables.tf            # Input variables (region, env, etc.)
├── stage.tfvars            # Variable values for the 'stage' environment
├── data.tf                 # Loads VPC state (optional use case)
├── outputs.tf              # Outputs (if needed in future)

📦 Resources Created
✅ aws_cloudwatch_log_group.docker_api
Name: /docker/api

Retention: 7 days

Lifecycle: prevent_destroy = true

✅ aws_ssm_parameter.docker_logs_config
Stores a JSON CloudWatch agent configuration under:

Name: /cloudwatch/docker-config

Type: String

Contains configuration for:

Agent metrics

Docker log file collection

Log stream format: {instance_id}/docker-api


⚙️ CloudWatch Agent Configuration (SSM)
The config stored in SSM /cloudwatch/docker-config looks like:
{
  "agent": {
    "metrics_collection_interval": 60,
    "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/lib/docker/containers/*/*.log",
            "log_group_name": "/docker/api",
            "log_stream_name": "{instance_id}/docker-api",
            "timezone": "UTC"
          }
        ]
      }
    }
  }
}


