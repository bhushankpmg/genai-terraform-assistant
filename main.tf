resource "aws_s3_bucket" "my_bucket" {
     bucket = "my-unique-bucket-name"  # Change this to a unique bucket name
     acl    = "private"

     tags = {
       Name        = "My S3 Bucket"
       Environment = "Dev"
     }