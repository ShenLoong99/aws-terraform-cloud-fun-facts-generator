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
      API_URL = aws_apigatewayv2_stage.default.invoke_url
    }
  }

  tags = {
    Component = "Backend"
    Service   = "FunFacts-API"
  }
}
