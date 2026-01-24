variable "function_name" {
  description = "Function name of lambda function"
  type        = string
}

variable "execution_arn" {
  description = "Execution ARN of the API Gateway"
  type        = string
}

variable "s3_bucket_id" {
  description = "ID of the S3 bucket"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "cdn_arn" {
  description = "ARN of the cloudfront distribution"
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
