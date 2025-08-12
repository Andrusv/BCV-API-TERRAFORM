AWS API Gateway & DynamoDB Auto-Deploy Pro 🚀
Automated, production-ready REST API deployment with AWS API Gateway, Lambda, and DynamoDB integration.

https://d1.awsstatic.com/logos/aws-logo-lockups/poweredbyaws/PB_AWS_logo_RGB_stacked_REV_SQ.91cd4af40773cbfbd15577a3c2b8a346fe3e8fa2.png

🔍 Overview
A Terraform module designed to automate the deployment of a fully functional REST API with DynamoDB backend and Lambda integration on AWS. Perfect for developers who need a scalable, serverless API solution with zero manual configuration for currency exchange rate management.

⚙️ Features
One-click deployment of complete API infrastructure

Auto-configured integration between API Gateway and DynamoDB

Automated Lambda function for rate updates and auditing

Production-ready security with IAM roles and least-privilege permissions

Built-in monitoring through CloudWatch Logs

Complete audit trail of Bolivar exchange rate changes

Idempotent — can be safely reapplied without side effects

🛠️ Technical Deep Dive
📜 Infrastructure Components
API Gateway:

Regional REST API endpoint

Automatic resource and method creation

Direct DynamoDB integration

DynamoDB Backend:

Pre-configured query patterns

Optimized for currency exchange rate data

Historical audit tracking of rate changes

Lambda Function:

Scheduled currency rate updates

Automatic Bolivar rate auditing against multiple currencies

Error handling and retry logic

Security:

Dedicated IAM roles for all services

Fine-grained DynamoDB access permissions

Optional WAF integration

Monitoring:

CloudWatch Logs for all API requests

Lambda execution logs and metrics

Detailed error logging and tracing

🚀 Quick Start
Prerequisites
AWS account with CLI configured

Terraform v1.0+ installed

DynamoDB table with correct schema

Required AWS permissions for Lambda, API Gateway, and DynamoDB

### Usage
Clone the repository:

```bash
git clone https://github.com/Andrusv/BCV-API-TERRAFORM.git
cd BCV-API-TERRAFORM
```

Configure variables:

### hcl

```terraform.tfvars
aws_region           = "us-east-1"
aws_access_key  = "YOUR_ACCESS_KEY"
aws_secret_key          = "YOUR_SECRET_KEY"
```

### Deploy infrastructure:

```bash
terraform init
terraform plan
terraform apply
```