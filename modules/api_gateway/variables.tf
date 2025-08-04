variable "lambda_invoke_arn" {
  description = "ARN de invocación de la función Lambda"
  type        = string
}

variable "waf_arn" {
  description = "ARN del WAF a asociar"
  type        = string
}

variable "aws_region" {
  description = "Región de AWS donde se desplegará el API Gateway"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB para almacenar los datos"
  type        = string
}