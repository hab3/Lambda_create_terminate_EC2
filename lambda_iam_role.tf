resource "aws_iam_role" "LambdaRole" {
  name = "LambdaRole"
  assume_role_policy = jsonencode({
    Version : "2012-10-17"
    Statement : [
      {
        Effect : "Allow"
        Principal : {
          "Service" : "lambda.amazonaws.com"
        }
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy_attachment" {
  role       = aws_iam_role.LambdaRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" #might be an issue
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment2" {
  role       = aws_iam_role.LambdaRole.name
  policy_arn = "arn:aws:iam::200724720630:policy/start_stop_instances"
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment1" {
  role       = aws_iam_role.LambdaRole.name
  policy_arn = "arn:aws:iam::200724720630:policy/service-role/AWSLambdaSNSTopicDestinationExecutionRole-fd103259-5865-48a3-b2ee-b72637e6c5e1"
}

