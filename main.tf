resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123456"  # Replace with a globally unique bucket name
  acl    = "private"  # Set the ACL for the bucket
  versioning {
    enabled = true  # Enable versioning
  }