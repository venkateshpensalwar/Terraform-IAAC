provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

module "security-group" {
     source  = "terraform-aws-modules/security-group/aws"
      name        = "web-server"
      description = "Security group for web-server with HTTP ports open within VPC"
      vpc_id      = "vpc-12345678"

}