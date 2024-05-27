import boto3

def delete_alarm(event, context):
    cloudwatch = boto3.client('cloudwatch')
    instance_id = event['detail']['instance-id']
    alarm_name = f"{instance_id}-cpu-alarm"

    try:
        cloudwatch.delete_alarms(
            AlarmNames=[alarm_name]
        )
        print(f"Alarm '{alarm_name}' deleted successfully.")
    except Exception as e:
        print(f"Error deleting alarm '{alarm_name}': {e}")
        # You might choose to suppress the error here if you don't want to
        # fail the Lambda function when an alarm doesn't exist.
        # raise e 
