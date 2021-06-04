provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket         = "new-terraform-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-dynamoDB"
  }
}