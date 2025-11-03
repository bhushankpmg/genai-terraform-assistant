Certainly! Below is a simple example of a Terraform configuration file that creates an AWS S3 bucket. This example assumes you have Terraform installed and configured to work with your AWS account.

1. **Create a directory for your Terraform configuration:**

   ```bash
   mkdir my-s3-bucket
   cd my-s3-bucket
   ```

2. **Create a file named `main.tf`:**

   ```hcl
   provider "aws" {
     region = "us-west-2"  # Change the region as needed
   }

   resource "aws_s3_bucket" "my_bucket" {
     bucket = "my-unique-bucket-name"  # Change this to a unique bucket name
     acl    = "private"

     tags = {
       Name        = "My S3 Bucket"
       Environment = "Dev"
     }
   }
   ```

3. **Initialize Terraform:**

   Run the following command in your terminal within the `my-s3-bucket` directory:

   ```bash
   terraform init
   ```

4. **Plan the deployment:**

   You can preview the actions that Terraform will take to create the S3 bucket:

   ```bash
   terraform plan
   ```

5. **Apply the configuration:**

   To create the S3 bucket, run:

   ```bash
   terraform apply
   ```

   You will be prompted to confirm the changes, type `yes` to proceed.

6. **Verify the bucket creation:**

   After applying the changes, you can verify that the bucket has been created in the AWS S3 console.

7. **Destroy the bucket (optional):**

   If you want to delete the bucket later, you can use:

   ```bash
   terraform destroy
   ```

   Again, you will be prompted to confirm the deletion by typing `yes`.

### Notes:
- Make sure to replace `"my-unique-bucket-name"` with a globally unique name for your S3 bucket as S3 bucket names must be unique across all existing bucket names in Amazon S3.
- You can adjust the `region` to match where you want to create the bucket.
- The `acl` can be changed according to the access permissions you wish to establish (e.g., `public-read` for a publicly accessible bucket).
- To make the configuration more robust, consider adding additional parameters and settings as needed based on your specific use case.