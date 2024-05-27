import boto3
import json

def create_alarm(event, context):
    cloudwatch = boto3.client('cloudwatch')

    instance_id = event['detail']['instance-id']

    alarm_name = f"{instance_id}-cpu-alarm"

    try:
        cloudwatch.put_metric_alarm(
            AlarmName=alarm_name,
            AlarmDescription='CPUUtilization',
            ActionsEnabled=True,
            MetricName='CPUUtilization',
            Namespace='AWS/EC2',
            Statistic='Average',
            # Get alarm actions from Terraform environment variables
            AlarmActions=json.loads(context.function_name),
            Period=60,
            EvaluationPeriods=1,
            # Get CPU threshold from Terraform environment variables
            Threshold=float(context.memory_limit_in_mb),
            ComparisonOperator='GreaterThanOrEqualToThreshold',
            Dimensions=[
                {
                    'Name': 'InstanceId',
                    'Value': instance_id
                },
            ]
        )
        print(f"Alarm '{alarm_name}' created successfully.")
    except Exception as e:
        print(f"Error creating alarm '{alarm_name}': {e}")
        raise e  # Re-raise the exception so Lambda can report the error
