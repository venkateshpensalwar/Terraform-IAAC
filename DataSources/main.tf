provider "aws" {
   region = "ap-south-1"
   profile = "default"
}

data "aws_vpc" "vpc-data" {
     default = true
}

output "data-output" {
  value = data.aws_vpc.vpc-data
}