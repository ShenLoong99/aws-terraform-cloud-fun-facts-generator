output "cloudfront_url" {
  description = "URL of website"
  value       = aws_cloudfront_distribution.frontend_cdn.domain_name
}

output "cloudfront_distribution_id" {
  description = "ID of the cloudfront distribution"
  value       = aws_cloudfront_distribution.frontend_cdn.id
}

output "cdn_arn" {
  description = "ARN of the cloudfront distribution"
  value       = aws_cloudfront_distribution.frontend_cdn.arn
}
