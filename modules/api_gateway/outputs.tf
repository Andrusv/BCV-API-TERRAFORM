output "api_url" {
  value = "${aws_api_gateway_stage.stage.invoke_url}/rates"
}

output "api_arn" {
  value = aws_api_gateway_rest_api.api.arn
}

output "stage_arn" {
  value = aws_api_gateway_stage.stage.arn
}

output "lambda_invoke_arn" {
  value = var.lambda_invoke_arn
}