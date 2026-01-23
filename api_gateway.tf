# API Gateway (HTTP API)
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

# Integration
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.funfacts_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.cloud_fun_facts.invoke_arn
  integration_method = "POST"
}

# Route
resource "aws_apigatewayv2_route" "funfact_route" {
  api_id    = aws_apigatewayv2_api.funfacts_api.id
  route_key = "GET /funfact"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# CORS Settings for API Gateway
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.funfacts_api.id
  name        = "$default"
  auto_deploy = true

  default_route_settings {
    throttling_burst_limit = 50
    throttling_rate_limit  = 100
  }
}
