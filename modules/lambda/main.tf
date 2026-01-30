# ZIP Lambda Source
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/lambda/lambda_function.zip"
}

# Lambda Function
resource "aws_lambda_function" "cloud_fun_facts" {
  function_name    = "CloudFunFacts"
  runtime          = "python3.13"
  handler          = "lambda_function.lambda_handler"
  role             = aws_iam_role.lambda_role.arn
  architectures    = ["arm64"] # Cheaper than x86_64
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  # Enable X-Ray Tracing for the Lambda function
  tracing_config {
    mode = "Active"
  }

  timeout = 30

  environment {
    variables = {
      API_URL = var.api_invoke_url
    }
  }

  tags = {
    Component = "Backend"
    Service   = "FunFacts-API"
  }
}

# IAM Role for Lambda
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

# lambda logs role
resource "aws_iam_role_policy_attachment" "lambda_basic_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Update IAM Role (Terraform) Lambda must be allowed to call Bedrock
resource "aws_iam_role_policy_attachment" "lambda_bedrock_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockFullAccess"
}
