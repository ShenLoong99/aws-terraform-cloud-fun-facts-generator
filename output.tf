output "api_invoke_url" {
  description = "Public API endpoint"
  value       = aws_apigatewayv2_api.funfacts_api.api_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.frontend_cdn.domain_name
}
