data "aws_lambda_function" "function" {
  function_name = var.lambda_function_name
}

resource "aws_cloudwatch_log_group" "function_log_group" {
  name              = "/aws/lambda/${data.aws_lambda_function.function.function_name}"
  retention_in_days = 7
  lifecycle {
    prevent_destroy = false
  }
}