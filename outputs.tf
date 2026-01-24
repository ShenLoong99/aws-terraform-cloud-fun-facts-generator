output "api_endpoint" {
  description = "Public API endpoint"
  value       = module.api.api_endpoint
}

output "cloudfront_url" {
  description = "URL of website"
  value       = module.cdn.cloudfront_url
}

output "s3_bucket_id" {
  description = "ID of the S3 bucket"
  value       = module.storage.s3_bucket_id
}

output "cloudfront_distribution_id" {
  description = "ID of the cloudfront distribution"
  value       = module.cdn.cloudfront_distribution_id
}

output "aws_region" {
  description = "AWS region to deploy resources"
  value       = var.aws_region
}
