data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "api" {
  name        = "exchange-rates-api-${terraform.workspace}"
  description = "API REST para tasas de cambio"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "rates" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "rates"
}

resource "aws_api_gateway_method" "get" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.rates.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "dynamodb" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.rates.id
  http_method = aws_api_gateway_method.get.http_method

  type                    = "AWS"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:${var.aws_region}:dynamodb:action/Query"
  credentials             = aws_iam_role.api_gateway.arn

  request_templates = {
    "application/json" = <<EOF
    {
      "TableName": "${var.dynamodb_table_name}",
      "KeyConditionExpression": "PK = :pk AND SK = :sk",
      "ExpressionAttributeValues": {
        ":pk": {"S": "current"},
        ":sk": {"S": "rates"}
      }
    }
    EOF
  }
}

resource "aws_iam_role_policy" "dynamodb_read" {
  name = "dynamodb-read-policy"
  role = aws_iam_role.api_gateway.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "dynamodb:Query",
        "dynamodb:GetItem"
      ],
      Resource = [
        "arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${var.dynamodb_table_name}",
        "arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${var.dynamodb_table_name}/index/*"
      ]
    }]
  })
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [aws_api_gateway_integration.dynamodb]

  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_iam_role" "api_gateway" {
  name = "api-gateway-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "apigateway.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_api_gateway_stage" "stage" {
  stage_name    = terraform.workspace
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}

resource "aws_wafv2_web_acl_association" "api_waf" {
  resource_arn = aws_api_gateway_stage.stage.arn
  web_acl_arn  = var.waf_arn
}