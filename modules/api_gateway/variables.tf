variable "lambda_invoke_arn" {
  description = "ARN de invocación de la función Lambda"
  type        = string
}

variable "waf_arn" {
  description = "ARN del WAF a asociar"
  type        = string
}