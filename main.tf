provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudFunFacts"
      Environment = "Production"
      ManagedBy   = "Terraform"
    }
  }
}

// Define all facts in one place
locals {
  cloud_facts = {
    "1"  = "AWS S3 was one of the very first AWS services, launched in 2006."
    "2"  = "Netflix runs almost all of its infrastructure on AWS."
    "3"  = "Cloud computing can save companies up to 30% on IT costs."
    "4"  = "NASA uses AWS to store and share Mars mission data with the public."
    "5"  = "AWS has more than 200 fully featured services today."
    "6"  = "The 'cloud' doesn’t float in the sky, it’s made of giant data centers on Earth."
    "7"  = "More than 90% of Fortune 100 companies use AWS."
    "8"  = "AWS data centers are so secure that they require retina scans and 24/7 guards."
    "9"  = "Serverless doesn’t mean there are no servers, it just means you don’t manage them."
    "10" = "Each AWS Availability Zone has at least one independent power source and cooling system."
    "11" = "Amazon once accidentally took down parts of the internet when S3 had an outage in 2017."
    "12" = "The fastest-growing AWS service is Amazon SageMaker, used for Machine Learning."
    "13" = "The word 'cloud' became popular in the 1990s as a metaphor for the internet."
    "14" = "AWS Lambda can automatically scale from zero to thousands of requests per second."
    "15" = "More data is stored in the cloud today than in all personal computers combined."
  }
}

// ZIP Lambda Source
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/lambda/lambda_function.zip"
}

// IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "cloud-fun-facts-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Lambda Function
resource "aws_lambda_function" "cloud_fun_facts" {
  function_name = var.lambda_function_name
  runtime       = "python3.13"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  architectures = ["arm64"] # Cheaper than x86_64

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout = 30

  environment {
    variables = {
      API_URL = aws_apigatewayv2_stage.default.invoke_url
    }
  }

  tags = {
    Component = "Backend"
    Service   = "FunFacts-API"
  }
}

# Add Log Retention (Crucial for cost)
resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${aws_lambda_function.cloud_fun_facts.function_name}"
  retention_in_days = 7 # Automatically deletes logs after 7 days
}

// API Gateway (HTTP API)
resource "aws_apigatewayv2_api" "funfacts_api" {
  name          = "FunfactsAPI"
  protocol_type = "HTTP"

  cors_configuration {
    allow_origins = ["*"] # Replace with Amplify domain for production
    allow_headers = ["Content-Type", "Authorization", "X-Amz-Date", "X-Api-Key", "X-Amz-Security-Token"]
    allow_methods = ["GET", "OPTIONS"]
    max_age       = 3600
  }
}

// Integration
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.funfacts_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.cloud_fun_facts.invoke_arn
  integration_method = "POST"
}

// Route
resource "aws_apigatewayv2_route" "funfact_route" {
  api_id    = aws_apigatewayv2_api.funfacts_api.id
  route_key = "GET /funfact"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

// Lambda Permission
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cloud_fun_facts.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.funfacts_api.execution_arn}/*/*"
}

// Create DynamoDB Table (Terraform)
resource "aws_dynamodb_table" "cloud_facts" {
  name         = "CloudFacts"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "FactID"

  attribute {
    name = "FactID"
    type = "S"
  }

  tags = {
    Name        = "CloudFacts-Database"
    Component   = "Data-Layer"
    Environment = "dev"
  }
}

// Create one DynamoDB item resource using for_each
resource "aws_dynamodb_table_item" "cloud_facts" {
  for_each = local.cloud_facts

  table_name = aws_dynamodb_table.cloud_facts.name
  hash_key   = aws_dynamodb_table.cloud_facts.hash_key

  item = jsonencode({
    FactID   = { S = each.key }
    FactText = { S = each.value }
  })
}

// Update Lambda IAM Role (Least Privilege) Attach DynamoDB Read-Only Policy
resource "aws_iam_role_policy_attachment" "lambda_dynamodb_read" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
}

// Update IAM Role (Terraform) Lambda must be allowed to call Bedrock
resource "aws_iam_role_policy_attachment" "lambda_bedrock_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockFullAccess"
}

// Create S3 Bucket for Frontend
resource "aws_s3_bucket" "frontend_bucket" {
  bucket        = "cloud-fun-facts-frontend-${random_id.bucket_id.hex}"
  force_destroy = true # optional: auto-delete objects on destroy

  tags = {
    Name      = "Frontend-Static-Assets"
    Component = "Frontend"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
/////////////////////////////////////////////////////////////////////////////////////////////////

// S3 Storage Lifecycle Policies
resource "aws_s3_bucket_lifecycle_configuration" "frontend_lifecycle" {
  bucket = aws_s3_bucket.frontend_bucket.id

  rule {
    id     = "cleanup-old-files"
    status = "Enabled"

    # This empty filter tells AWS the rule applies to the WHOLE bucket
    filter {}

    # Example 1: Permanently delete objects after 30 days
    expiration {
      days = 30
    }

    # Example 2: If you enabled versioning, delete non-current versions after 7 days
    noncurrent_version_expiration {
      noncurrent_days = 7
    }
  }
}

// Add the S3 Bucket Policy
resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.frontend_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.frontend_cdn.arn
          }
        }
      }
    ]
  })
}

# Upload index.html
# Commented out to allow GitHub Actions to handle the upload with the correct API URL
# resource "aws_s3_object" "frontend_index" {
#   bucket       = aws_s3_bucket.frontend_bucket.id
#   key          = "index.html"
#   content_type = "text/html"

#   # Use templatefile to inject the API URL dynamically
#   content = templatefile("${path.module}/frontend/index.html", {
#     api_url = aws_apigatewayv2_stage.default.invoke_url
#   })

#   # This forces a re-upload if the content changes
#   etag = md5(templatefile("${path.module}/frontend/index.html", {
#     api_url = aws_apigatewayv2_stage.default.invoke_url
#   }))
# }

// CORS Settings for API Gateway
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.funfacts_api.id
  name        = "$default"
  auto_deploy = true

  default_route_settings {
    throttling_burst_limit = 50
    throttling_rate_limit  = 100
  }
}

// Create an Origin Access Control (OAC) for CloudFront
resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name                              = "frontend-s3-oac"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
  origin_access_control_origin_type = "s3"
}

// Create CloudFront distribution
resource "aws_cloudfront_distribution" "frontend_cdn" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.frontend_bucket.bucket_regional_domain_name
    origin_id   = "s3-frontend-origin"

    origin_access_control_id = aws_cloudfront_origin_access_control.s3_oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-frontend-origin"

    viewer_protocol_policy = "redirect-to-https"

    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6" # CachingOptimized
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name      = "CloudFunFacts-CDN"
    Component = "Delivery"
  }
}
