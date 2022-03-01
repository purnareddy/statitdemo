resource "aws_s3_bucket" "statit_s3_bucket" {
  bucket = "statit-s3-bucket"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "text_file" {
  key                    = "statit-text-file"
  bucket                 = aws_s3_bucket.statit_s3_bucket.id
  source                 = "../text_file1.txt"
  server_side_encryption = "AES256"
}