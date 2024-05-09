# Zip the python file containing the Lambda function to create instances tagged insta
data "archive_file" "zip_lambda_createEC2" {
  type        = "zip"
  source_file  = "${path.module}/python_files/lambda_createEC2.py"
  output_path = "${path.module}/python_files/lambda_createEC2.zip"

}

#create the lambda function in AWS
resource "aws_lambda_function" "create_insta_instances" {
  filename      = "${path.module}/python_files/lambda_createEC2.zip" # Update with the path to your Lambda function code
  function_name = "Create_Insta_Instances"
  role          = aws_iam_role.LambdaRole.arn
  handler       = "lambda_createEC2.lambda_handler"                  #name of the file containing the lambda python script.name of the handler defined in the script
  runtime       = "python3.12"                                       # Update with your Lambda function runtime
  timeout       = 30                                                        # Update with your Lambda function testing timeout

  environment {
    variables = {
      TAG_KEY   = "Name"
      TAG_VALUE = "insta"
    }
  }
}



# Repeat to create the Lambda function that Terminates instances
data "archive_file" "zip_lambda_terminateEC2" {
  type        = "zip"
  source_file  = "${path.module}/python_files/lambda_terminateEC2.py"
  output_path = "${path.module}/python_files/lambda_terminateEC2.zip"

} 

#create the lambda function in AWS
resource "aws_lambda_function" "terminate_insta_instances" {
  filename      = "${path.module}/python_files/lambda_terminateEC2.zip" # Update with the path to your Lambda function code
  function_name = "Terminate_Insta_Instances"
  role          = aws_iam_role.LambdaRole.arn
  handler       = "lambda_terminateEC2.lambda_handler"
  runtime       = "python3.12" # Update with your Lambda function runtime
  timeout       = 30                                                        # Update with your Lambda function testing timeout

  
  environment {
    variables = {
      TAG_KEY   = "Name"
      TAG_VALUE = "insta"
    }
  }
}