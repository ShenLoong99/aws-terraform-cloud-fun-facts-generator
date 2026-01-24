output "s3_bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.frontend_bucket.id
}

output "bucket_regional_domain_name" {
  description = "Bucket regional domain name of the S3 bucket"
  value       = aws_s3_bucket.frontend_bucket.bucket_regional_domain_name
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.frontend_bucket.arn
}
