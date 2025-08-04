variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "Access key para AWS"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "Secret key para AWS"
  type        = string
  sensitive   = true
}