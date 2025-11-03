To create an S3 bucket and update environment variables in a production account using Terraform, you'll need to configure the AWS provider and define resources for the S3 bucket and the necessary IAM roles or policies if required. 

Below is an example Terraform configuration that shows how to create an S3 bucket. Additionally, it updates environment variables in an AWS Lambda function as a common method of managing environment variables in a production account. 

First, make sure you have Terraform installed and configured with your AWS credentials.

Here's a basic example of a Terraform configuration that includes an S3 bucket and updates a Lambda function's environment variables:

```hcl
provider "aws" {
  region = "us-west-2"  # Change to your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "production"
  }
}

# Assume you have an existing Lambda function for which you want to update environment variables
resource "aws_lambda_function" "my_lambda_function" {
  function_name = "myLambdaFunction"

  # Assuming you have a zip file for your lambda code
  filename         = "lambda_function.zip"
  handler          = "lambda_function.handler"
  runtime          = "python3.8"
  
  role             = aws_iam_role.lambda_exec.arn  # Reference to an IAM role

  environment {
    variables = {
      MY_VARIABLE = "some_value"
      BUCKET_NAME = aws_s3_bucket.my_bucket.bucket
    }
  }
}

# IAM Role for Lambda Function
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Policy to allow the Lambda function to access the S3 bucket
resource "aws_iam_policy" "lambda_s3_access" {
  name        = "lambda_s3_access_policy"
  description = "Policy to allow Lambda to access S3 bucket"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.my_bucket.arn,
          "${aws_s3_bucket.my_bucket.arn}/*"
        ]
        Effect = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_lambda_policy" {
  policy_arn = aws_iam_policy.lambda_s3_access.arn
  role       = aws_iam_role.lambda_exec.name
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
```

### Explanation:
1. **Provider Configuration**: Set the region for your AWS resources.
2. **S3 Bucket Resource**: Create an S3 bucket with a unique name and desired ACL.
3. **IAM Role for Lambda**: Define an IAM role that your Lambda function will assume to execute.
4. **Policy for S3 Access**: Create a policy that allows your Lambda function to access the S3 bucket.
5. **Lambda Function**: Create a Lambda function that uses the IAM role, includes environment variables (including the S3 bucket name), and points to the location of the Lambda code.
6. **Outputs**: Output the name of the created S3 bucket.

### To Apply:
1. Save this configuration to a file called `main.tf`.
2. Run the following commands:
   ```
   terraform init
   terraform apply
   ```

### Note:
- Make sure to replace `"my-unique-bucket-name"` with a globally unique S3 bucket name.
- Modify the Lambda function details according to your requirements.
- This example assumes you have the Lambda code in a zip file named `lambda_function.zip` in the same directory as your Terraform configuration. Adjust as necessary depending on your setup.
- Ensure you have permissions to create these resources in your AWS account.