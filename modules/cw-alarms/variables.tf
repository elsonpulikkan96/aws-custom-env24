variable "alarm_actions" {
  type        = list(string)
  description = "List of SNS topic ARNs to send notifications to"
}

variable "cpu_threshold" {
  type        = number
  description = "CPU utilization threshold for alarm (%)"
  default     = 80
}

variable "instance_ids" {
  type        = list(string)
  description = "List of EC2 instance IDs to monitor"
}

