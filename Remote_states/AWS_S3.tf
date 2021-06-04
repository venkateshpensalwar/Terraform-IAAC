resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "new-terraform-bucket"


  versioning {
    enabled = true
  }
}
