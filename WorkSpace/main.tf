provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "vm_1" {
  ami = "ami-010aff33ed5991201"
  instance_type = lookup(
    var.instance-type, terraform.workspace, "Env Not Found"
  )
  key_name        = lookup(var.key-name, "${terraform.workspace}", "Key Not Found")
  security_groups = ["default"]
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "amazon"
  }
}


output "out-1" {
  value = terraform.workspace
}
