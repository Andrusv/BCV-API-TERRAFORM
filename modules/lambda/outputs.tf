output "function_name" {
  value = aws_lambda_function.exchange_updater.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.exchange_updater.arn
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.exchange_updater.invoke_arn
}