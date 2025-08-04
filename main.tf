module "networking" {
  source      = "./modules/networking"
  environment = terraform.workspace
}

module "security" {
  source      = "./modules/security"
  vpc_id      = module.networking.vpc_id
  environment = terraform.workspace
}

module "database" {
  source     = "./modules/database"
  subnet_ids = module.networking.private_subnets
  sg_id      = module.security.dax_sg_id
  environment = terraform.workspace
}

module "lambda" {
  source          = "./modules/lambda"
  dynamodb_table  = module.database.dynamodb_table
  lambda_zip_path = "./lambda_code/lambda_package.zip"
  subnet_id       = module.networking.private_subnets[0]
  sg_id           = module.security.lambda_sg_id
  environment     = terraform.workspace
  api_gateway_execution_arn = "${module.api_gateway.api_arn}/*"
}

module "api_gateway" {
  source         = "./modules/api_gateway"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  waf_arn        = module.security.waf_arn
}

module "eventbridge" {
  source     = "./modules/eventbridge"
  lambda_arn = module.lambda.lambda_arn
  schedule   = "cron(0 0 * * ? *)" # 00:00 UTC (8pm Venezuela)
}