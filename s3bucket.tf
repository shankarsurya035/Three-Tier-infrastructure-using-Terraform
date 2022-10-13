

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-sur-shakti"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read-write"
}


resource "aws_s3_bucket_object" "ob" {
  bucket = aws_s3_bucket.b.id
  key    = "new_object_ke"
  source = "venafi/surya.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("venafi/surya.txt")
}