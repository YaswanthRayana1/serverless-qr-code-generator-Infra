module "lamda_function" {
  source = "./lambda"
  
  handeler_file = "index"
  lambda_runtime =  "nodejs18.x"
  s3_bucket_name = "test-bucket-ksgdwask"
  s3_key = "app.zip"
  data_s3_bucket_name = "data-lambdas3-bucket-15102023"
  depends_on = [ module.s3_bucket ]

}
module "s3_bucket" {
  source = "./S3"
  bucket_name = "data-lambdas3-bucket-15102023"
}
module "api_GateWay" {
  source = "./APIGateway"
}