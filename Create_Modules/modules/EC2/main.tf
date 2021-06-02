
###########################################################
# AWS instance
###########################################################

resource "aws_instance" "instances" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = var.list_SG
    tags = {
        Name = var.instance_name
            }
}