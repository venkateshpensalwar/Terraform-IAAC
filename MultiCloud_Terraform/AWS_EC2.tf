## to launch EC2 instance in production that is in AWS ENV


resource "aws_instance" "web-server-production"{
	ami = "ami-010aff33ed5991201"
	instance_type = "t2.micro"
	security_groups = [ "default" ]
	key_name = "newKey"
	tags = {
		Name = "webserver"
	}
    count = var.is_it_Production_ENV ? 1 : 0
}