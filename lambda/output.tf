output "aws_lambda_function" {
  value = aws_lambda_function.qr-code-generator
}

output "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda to access S3"
  value       = aws_iam_role.lambda_exec.arn
}