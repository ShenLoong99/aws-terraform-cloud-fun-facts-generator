output "function_name" {
  description = "Function name of lambda function"
  value       = aws_lambda_function.cloud_fun_facts.function_name
}

output "invoke_arn" {
  description = "Invoke ARN of lambda function"
  value       = aws_lambda_function.cloud_fun_facts.invoke_arn
}
