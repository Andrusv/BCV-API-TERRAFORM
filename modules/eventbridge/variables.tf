variable "lambda_arn" {
  description = "ARN de la función Lambda"
  type        = string
}

variable "schedule" {
  description = "Expresión cron para la ejecución programada"
  type        = string
  default     = "cron(0 0 * * ? *)" # Diario a las 00:00 UTC
}