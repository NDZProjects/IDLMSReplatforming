data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "artifact" {
  bucket = "idlms-${var.environment}-built-artifact-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "IDLMS ${var.environment} Artifact Bucket"
    Environment = var.environment
  }

  force_destroy = true
}
