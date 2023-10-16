resource "aws_dynamodb_table" "user" {
  name           = "User"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "email"
  attribute {
    name = "email"
    type = "S" 
  }
  
  tags = {
    "info" = "user table"
  }
}
resource "aws_dynamodb_table" "products" {
  name           = "Product"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "url"

  attribute {
    name = "url"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

  global_secondary_index {
    name               = "user_email-index"
    hash_key           = "email"
    projection_type    = "ALL"
  }
}
