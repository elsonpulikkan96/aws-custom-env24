# Data Sources to Create ZIP Archives for Lambda Functions
data "archive_file" "create_alarm_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambdas" # Updated path
  output_path = "${path.module}/lambdas/createAlarm.zip" # Updated path
}

data "archive_file" "delete_alarm_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambdas" # Updated path
  output_path = "${path.module}/lambdas/deleteAlarm.zip" # Updated path
}

# Lambda Functions (Updated to use correct path)
resource "aws_lambda_function" "create_alarm" {
  filename         = data.archive_file.create_alarm_zip.output_path
  function_name    = "create_alarm"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "createAlarm.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.create_alarm_zip.output_path) # Updated to use filebase64sha256
  runtime          = "python3.10"
  timeout          = 30
  environment {
        variables = {
        alarm_actions = jsonencode(var.alarm_actions)
        cpu_threshold = var.cpu_threshold
        }
  }
}

resource "aws_lambda_function" "delete_alarm" {
  filename         = data.archive_file.delete_alarm_zip.output_path
  function_name    = "delete_alarm"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "deleteAlarm.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.delete_alarm_zip.output_path) # Updated to use filebase64sha256
  runtime          = "python3.10"
  timeout          = 30
  environment {
        variables = {
        alarm_actions = jsonencode(var.alarm_actions)
        cpu_threshold = var.cpu_threshold
        }
  }
}
# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for Lambda
resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "Allows Lambda functions to access CloudWatch and SNS"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "cloudwatch:PutMetricAlarm",
          "cloudwatch:DeleteAlarms",
          "sns:Publish"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach IAM Policy to Role
resource "aws_iam_role_policy_attachment" "lambda_exec_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# CloudWatch Event Rules and Targets for Instance Start/Stop

# Resource to create CloudWatch Alarms
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  count               = length(var.instance_ids)
  alarm_name          = "${var.instance_ids[count.index]}-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Alarm when CPU exceeds threshold"
  alarm_actions       = var.alarm_actions

  dimensions = {
    InstanceId = var.instance_ids[count.index]
  }
}
