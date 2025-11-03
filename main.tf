resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-s3-bucket-name" # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }