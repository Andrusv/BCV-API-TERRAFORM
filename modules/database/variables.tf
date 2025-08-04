variable "subnet_ids" {
  description = "IDs de las subnets privadas"
  type        = list(string)
}

variable "sg_id" {
  description = "ID del security group para DAX"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}