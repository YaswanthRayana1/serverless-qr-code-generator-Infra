resource "aws_lambda_function" "qr-code-generator" {
  function_name = var.lambda_function_name 
  
  s3_bucket = var.s3_bucket_name
  s3_key    = var.s3_key

  handler = "${ var.handeler_file }.handler" 
  runtime = var.lambda_runtime 

  role = "${aws_iam_role.lambda_exec.arn}"
}



resource "aws_iam_role" "lambda_exec" {
  name = "serverless_example_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_s3_bucket" "s3_bucket" {
 bucket = var.data_s3_bucket_name
}


resource "aws_iam_policy" "s3_access" {
  name        = "LambdaS3AccessPolicy"
  description = "Policy that grants Lambda access to S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        Resource = [
             data.aws_s3_bucket.s3_bucket.arn ,
          "${ data.aws_s3_bucket.s3_bucket.arn }/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.s3_access.arn
}

data "aws_dynamodb_table" "user_table" {
  name =  var.user_table_name
}
data "aws_dynamodb_table" "product_table" {
  name =  var.product_table_name
}
resource "aws_iam_policy" "dynamodb_crud" {
  name        = "DynamoDBCrudPolicy"
  description = "Allow CRUD operations on the DynamoDB table."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ],
        Resource = [
          data.aws_dynamodb_table.user_table.arn,

        ]
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "attach_lambda_to_dynamodb" {
  policy_arn = aws_iam_policy.dynamodb_crud.arn
  role       = aws_iam_role.lambda_exec.name
}

resource "aws_iam_policy" "function_logging_policy" {
  name   = "function-logging-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Action : [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect : "Allow",
        Resource : "arn:aws:logs:*:*:*"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "function_logging_policy_attachment" {
  role = aws_iam_role.lambda_exec.id
  policy_arn = aws_iam_policy.function_logging_policy.arn
}