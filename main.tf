# Add Log Retention (Crucial for cost)
resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${aws_lambda_function.cloud_fun_facts.function_name}"
  retention_in_days = 7 # Automatically deletes logs after 7 days
}
