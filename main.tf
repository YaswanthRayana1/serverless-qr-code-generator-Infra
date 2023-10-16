module "lamda_function" {
  source               = "./lambda"
  lambda_function_name = "qr-code-generator"
  handeler_file        = "index"
  lambda_runtime       = "nodejs18.x"
  s3_bucket_name       = "test-bucket-ksgdwask"
  s3_key               = "app.zip"
  data_s3_bucket_name  = "data-lambdas3-bucket-15102023"
  product_table_name   = "Product"
  user_table_name      = "User"
  depends_on           = [module.s3_bucket, module.dynamodb_tables]

}
module "s3_bucket" {
  source      = "./S3"
  bucket_name = "data-lambdas3-bucket-15102023"
}
module "dynamodb_tables" {
  source = "./DynamoDB"
}
module "api_GateWay" {
  depends_on = [module.lamda_function]
  source     = "./APIGateway"
}
module "cloudWatch_logs" {
  source = "./cloudWatchLogs"
  lambda_function_name = "qr-code-generator"
}