variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "default_tags" {
  description = "Extra tags to pass to the provider"
  type        = map(string)
}

variable "lambda_role_name" {
  description = "Name of lambda role name"
  type        = string
}
