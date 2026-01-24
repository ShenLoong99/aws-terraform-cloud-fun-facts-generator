output "api_endpoint" {
  description = "Public API endpoint"
  value       = aws_apigatewayv2_api.funfacts_api.api_endpoint
}

output "execution_arn" {
  description = "Execution ARN of the API Gateway"
  value       = aws_apigatewayv2_api.funfacts_api.execution_arn
}

output "api_invoke_url" {
  description = "API Invoke URL"
  value       = aws_apigatewayv2_stage.default.invoke_url
}
