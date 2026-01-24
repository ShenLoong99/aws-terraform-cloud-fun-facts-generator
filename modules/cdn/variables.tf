variable "bucket_regional_domain_name" {
  description = "Bucket regional domain name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "default_tags" {
  description = "Extra tags to pass to the provider"
  type        = map(string)
}
