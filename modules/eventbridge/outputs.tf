output "event_rule_arn" {
  description = "ARN de la regla de EventBridge"
  value       = aws_cloudwatch_event_rule.daily_update.arn
}