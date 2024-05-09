import json
import boto3

def lambda_handler(event, context):
    # Initialize the EC2 client
    ec2 = boto3.client('ec2')
    
    # Create instances
    create_instances(ec2, "Insta")

def create_instances(ec2, tag_value):
    # Specify the instance parameters
    instance_params = {
        'ImageId': 'ami-04e5276ebb8451442',  # Replace with your desired AMI ID
        'InstanceType': 't2.micro',  # Replace with your desired instance type
        'MaxCount': 2,
        'MinCount': 2,
        'TagSpecifications': [
            {
                'ResourceType': 'instance',
                'Tags': [
                    {'Key': 'Name', 'Value': tag_value}
                ]
            }
        ]
    }
    
    # Create instances
    response = ec2.run_instances(**instance_params)
    
    # Print instance IDs
    for instance in response['Instances']:
        instance_id = instance['InstanceId']
        print(f"Instance {instance_id} tagged as '{tag_value}' created.")

