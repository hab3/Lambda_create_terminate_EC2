
Project Description:

This project is designed to create and configure an AWS Lambda function using Python, interact with AWS services through the Boto3 library, and automate the process of launching an EC2 instance.

Scenario:

Dansnom Limited is seeking an automated solution to manage EC2 instances effectively in their AWS environment. The goal is to reduce costs, improve resource utilization, and ensure that instances are terminated when no longer needed. This project outlines the use case for automating EC2 instance management.



STEPS
Step 1: Setup IAM and Architecture

- Set up IAM roles for Lambda. Attach to this role 
        - a policy to create and terminate EC2 intances.
        - basic lambda execution policies to create a log group in cloudwatch events and publish logs
        - SNS topic destination policy 

- Sketch a basic architecture diagram.

- Capture a screenshot of the IAM roles setup and architecture diagram.


Step 2: Create Lambda Functions Using Terraform

- Write a Lambda functions Using Terraform to create 2 instances

- Define instance specifications as environment variables.

- Tag instances as 'Insta'


Step 3: Cleanup Lambda Function

- Write a Lambda function Using Terraform to terminate 'Insta' EC2s that have ran longer than 3 minutes 
    (assuming it takes 3 minutes for the job running in the instances to be completed)


Step 4: Configure Triggers

- Configure CloudWatch Events to trigger the Lambda function to create 'Insta' instances at 5pm UTC on thursdays and Fridays.

- Configure another Cloudwatch Events to trigger the termination of 'Insta' instances every 20 minutes between 5pm and 6pm UTC

- Set event sources for creation and cleanup triggers.

- Capture a screenshot of the trigger configuration.

Step 5: Test and Validate

- Test both Lambda functions with sample events.

- Verify correct instance creation and termination.

- Capture screenshots of successful test results.

Step 6: Document and Train

- Create clear documentation for deploying and using the automation.

- Provide training on the solution to users or students.

- Commit all code, architecture diagram, and IAM policy to GitHub.

- Submit the GitHub repository link along with screenshots, architecture diagram, and IAM policy as part of your submission.
