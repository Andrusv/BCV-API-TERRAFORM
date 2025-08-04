output "api_gateway_url" {
  description = "URL del API Gateway"
  value       = module.api_gateway.api_url
}

output "lambda_function_name" {
  description = "Nombre de la función Lambda"
  value       = module.lambda.function_name
}

output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = module.database.dynamodb_table_name
}

output "waf_arn" {
  description = "ARN del WAF"
  value       = module.security.waf_arn
}