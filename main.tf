resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "production"
  }