variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "lambda_function_name" {
  default = "CloudFunFacts"
}