variable "s3_bucket_name" {
  type = string
}
variable "s3_key" {
  type = string
}
variable "lambda_runtime" {
  type = string
  default = "nodejs16.x"
}
variable "handeler_file" {
  type = string
}
variable "data_s3_bucket_name" {
  type = string
  
}
variable "user_table_name" {
  type = string
}
# variable "lambda_s3_bucket" {
#   type = string
  
# }