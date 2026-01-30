variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "default_tags" {
  description = "Extra tags to pass to the provider"
  type        = map(string)
}

variable "cdn_arn" {
  description = "ARN of the cloudfront distribution"
  type        = string
}
