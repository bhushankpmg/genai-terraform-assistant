Sure! Below is a simple Terraform configuration to create an Amazon S3 bucket. This example assumes you have Terraform installed and configured to work with your AWS account.

### Main Configuration File (`main.tf`)

```hcl
provider "aws" {
  region = "us-west-2"  # Specify your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123456"  # Replace with a globally unique bucket name
  acl    = "private"  # Set the ACL for the bucket
  versioning {
    enabled = true  # Enable versioning
  }

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}

# Optional: Enable server-side encryption with Amazon S3-Managed Keys (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
```

### Instructions to Use the Configuration

1. **Customize the Bucket Name**: The bucket name must be globally unique across S3. Replace `"my-unique-bucket-name-123456"` with a unique name for your bucket.

2. **Initialize Terraform**: Open your terminal and navigate to the directory containing your `main.tf`, then run:
   ```bash
   terraform init
   ```

3. **Plan the Changes**: Generate an execution plan to see what will happen:
   ```bash
   terraform plan
   ```

4. **Apply the Changes**: Create the resources defined in your configuration:
   ```bash
   terraform apply
   ```
   Confirm the action when prompted.

5. **Verify**: After the apply is complete, you can log into your AWS Management Console and verify that the S3 bucket has been created.

### Additional Notes
- You can modify parameters such as `acl`, `versioning`, and tags according to your needs.
- Make sure that your AWS credentials are available either through environment variables, the AWS credentials file, or IAM roles if you are running Terraform in an AWS environment (like EC2).