
provider "aws" {
    region = "ap-south-1"
    profile = "default"
}
module "EC2" {
    source = "./modules/EC2"
    key_name = "newKey"
    ami = "ami-010aff33ed5991201"
    instance_type = "t2.micro"
    list_SG = ["default"]
    instance_name = "name"

}

# This type of files team will use and fetch all resource from central module
# they will pass variables according to there requirements so we don't need to change code again and again