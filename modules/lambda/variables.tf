variable "dynamodb_table" {
  description = "Objeto con name y arn de la tabla DynamoDB"
  type = object({
    name = string
    arn  = string
  })
}

variable "lambda_zip_path" {
  description = "Ruta al archivo zip del código Lambda"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet donde desplegar la Lambda"
  type        = string
}

variable "sg_id" {
  description = "ID del security group para la Lambda"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "api_gateway_execution_arn" {
  description = "ARN de ejecución del API Gateway"
  type        = string
}