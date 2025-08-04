output "dynamodb_table" {
  value = {
    name = aws_dynamodb_table.exchange_rates.name
    arn  = aws_dynamodb_table.exchange_rates.arn
  }
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.exchange_rates.name
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.exchange_rates.arn
}