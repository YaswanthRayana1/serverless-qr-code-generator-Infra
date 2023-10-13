provider "aws" {
  access_key                  = var.aws_access_key
  secret_key                  = var.aws_secret_key
  region                      = var.aws_region
  // s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    acm            =  var.endpoints
    apigateway     = var.endpoints
    cloudformation = var.endpoints
    cloudwatch     = var.endpoints
    dynamodb       = var.endpoints
    ec2            = var.endpoints
    es             = var.endpoints
    firehose       = var.endpoints
    iam            = var.endpoints
    kinesis        = var.endpoints
    kms            = var.endpoints
    lambda         = var.endpoints
    rds            = var.endpoints
    route53        = var.endpoints
    s3             = var.endpoints
    secretsmanager = var.endpoints
    ses            = var.endpoints
    sns            = var.endpoints
    sqs            = var.endpoints
    ssm            = var.endpoints
    stepfunctions  = var.endpoints
    sts            = var.endpoints
  }
}
