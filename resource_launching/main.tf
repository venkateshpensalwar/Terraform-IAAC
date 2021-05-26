## to launch resources we need to tell first which cloud
## in terraform those who gives us resources known as "providers"
## we are using "AWS" we need to tell

provider "aws" {
    region = "ap-south-1"
    profile = "default"          ## it comming from aws_cli or you can pass credentails here

}

## we selected provider they have many attribute you can refer to documentation
## whenever we give provider they will download plugin for it to communicate with provider
## so to download it run "terraform init" it only work for directory level

## we will launch resource

resource "aws_instance" "vm_1" {
    ami = "ami-010aff33ed5991201"
    instance_type = "t2.micro"
    key_name = "newKey"
    security_groups = ["default"]
    root_block_device {
      volume_size = 10
    }
    tags = {
        Name = "amazon"
            }
}