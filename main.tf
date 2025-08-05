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
  source      = "./modules/database"
  subnet_ids  = module.networking.private_subnets
  sg_id       = module.security.dax_sg_id
  environment = terraform.workspace
}

module "lambda" {
  source              = "./modules/lambda"
  lambda_zip_path     = "./lambda_code/lambda_package.zip"
  environment         = terraform.workspace
  dynamodb_table_name = module.database.dynamodb_table_name
  dynamodb_table_arn  = module.database.dynamodb_table_arn
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  lambda_invoke_arn   = module.lambda.lambda_invoke_arn
  waf_arn             = module.security.waf_arn
  aws_region          = var.aws_region
  dynamodb_table_name = module.database.dynamodb_table_name
}