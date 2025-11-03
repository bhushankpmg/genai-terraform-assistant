resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Ensure this name is globally unique
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }