variable "subnet_ids" {
  description = "IDs de las subnets privadas"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}