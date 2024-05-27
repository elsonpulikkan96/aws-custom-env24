# modules/cloudwatch-alarms/outputs.tf

output "cpu_alarm_arns" {
  description = "ARNs of the created CPU utilization alarms"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm[*].arn
}
