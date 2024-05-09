import json
import boto3
import datetime

def lambda_handler(event, context):
    # Initialize the EC2 client
    ec2 = boto3.client('ec2')
    
    # Get current time
    current_time = datetime.datetime.utcnow()
    
    # Get instances tagged "insta"
    instances = ec2.describe_instances(
        Filters=[
            {'Name': 'tag:Name', 'Values': ['Lambda_EC2']}
        ]
    )['Reservations']
    
    # Terminate instances that have been running for 6 hours
    for reservation in instances:
        for instance in reservation['Instances']:
            launch_time = instance['LaunchTime']
            running_time = current_time - launch_time.replace(tzinfo=None)
            if running_time.total_seconds() >= 180:  # 3 minutes in seconds
                instance_id = instance['InstanceId']
                ec2.terminate_instances(InstanceIds=[instance_id])
                print(f"Instance {instance_id} terminated after running for 3 minutes.")
