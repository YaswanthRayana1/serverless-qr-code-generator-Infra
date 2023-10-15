resource "aws_dynamodb_table" "user" {
  name           = var.user_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.user_hash_key
  
  attribute {
    name = var.user_hash_key
    type = "S" 
  }
  
  tags = var.user_tag
}
resource "aws_dynamodb_table" "product" {
  name           = var.user_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.user_hash_key
  
  attribute {
    name = var.user_hash_key
    type = "S" 
  }
  
  tags = var.user_tag
}