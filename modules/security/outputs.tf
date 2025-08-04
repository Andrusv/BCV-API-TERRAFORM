output "dax_id_security_group" {
  value = aws_security_group.dax.id
}

output "lambda_id_security_group" {
  value = aws_security_group.lambda.id
}

output "waf_arn_api" {
  value = aws_wafv2_web_acl.api_waf.arn
}