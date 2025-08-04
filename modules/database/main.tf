resource "aws_dynamodb_table" "exchange_rates" {
  name         = "ExchangeRates-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"  # On-Demand (sin provisionar capacidad)
  hash_key     = "PK"
  range_key    = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  # Índice para auditoría
  local_secondary_index {
    name            = "AuditIndex"
    projection_type = "ALL"
    range_key       = "SK"
  }

  # Configuración para alta escalabilidad
  point_in_time_recovery {
    enabled = true  # Backup automático (opcional, costo adicional mínimo)
  }

  tags = {
    Environment = var.environment
  }
}