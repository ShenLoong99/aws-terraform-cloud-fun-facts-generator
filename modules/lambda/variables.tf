variable "role_arn" {
  description = "ARN of the lambda role"
  type        = string
}

variable "api_invoke_url" {
  description = "API Invoke URL"
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
