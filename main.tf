# Local variables
locals {
  common_tags = {
    Project     = "CloudFunFacts"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

# Module for API Gateway
module "api" {
  source        = "./modules/api"
  invoke_arn    = module.lambda.invoke_arn
  aws_region    = var.aws_region
  default_tags  = local.common_tags
  function_name = module.lambda.function_name
  execution_arn = module.api.execution_arn
}

# Module for Cloudfront
module "cdn" {
  source                      = "./modules/cdn"
  bucket_regional_domain_name = module.storage.bucket_regional_domain_name
  aws_region                  = var.aws_region
  default_tags                = local.common_tags
}

# Module for DynamoDB
module "database" {
  source           = "./modules/database"
  aws_region       = var.aws_region
  default_tags     = local.common_tags
  lambda_role_name = module.lambda.lambda_role_name
}

# Module for Lambda
module "lambda" {
  source         = "./modules/lambda"
  api_invoke_url = module.api.api_invoke_url
  aws_region     = var.aws_region
  default_tags   = local.common_tags
}

# Module for S3
module "storage" {
  source       = "./modules/storage"
  aws_region   = var.aws_region
  default_tags = local.common_tags
  cdn_arn      = module.cdn.cdn_arn
}

# Add Log Retention (Crucial for cost)
resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${module.lambda.function_name}"
  retention_in_days = 7 # Automatically deletes logs after 7 days
}
