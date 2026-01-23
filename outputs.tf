output "api_invoke_url" {
  description = "Public API endpoint"
  value       = aws_apigatewayv2_api.funfacts_api.api_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.frontend_cdn.domain_name
}

output "s3_bucket_id" {
  value = aws_s3_bucket.frontend_bucket.id
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend_cdn.id
}

output "aws_region" {
  value = var.aws_region
}
