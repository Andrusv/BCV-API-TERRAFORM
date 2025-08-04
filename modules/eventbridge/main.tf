resource "aws_cloudwatch_event_rule" "daily_update" {
  name                = "daily-exchange-rate-update"
  description         = "Trigger Lambda to update exchange rates daily at 8pm Venezuela time (00:00 UTC)"
  schedule_expression = var.schedule # "cron(0 0 * * ? *)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.daily_update.name
  target_id = "trigger-lambda"
  arn       = var.lambda_arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.daily_update.arn
}