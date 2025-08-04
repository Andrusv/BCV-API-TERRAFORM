variable "lambda_zip_path" {
  description = "Ruta al archivo zip del código Lambda"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  type        = string
}