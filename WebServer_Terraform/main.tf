provider "aws" {
     region = "ap-south-1"
     profile = "default"
}


resource aws_instance "web-server"{
	ami = "ami-010aff33ed5991201"
	instance_type = "t2.micro"
	security_groups = [ "default" ]
	key_name = "newKey"
	tags = {
		Name = "webserver"
	}
}

resource "aws_ebs_volume" "web-volume" {
    depends_on = [aws_instance.web-server]

  availability_zone = aws_instance.web-server.availability_zone
  size              = 2
  tags = {
    Name = "webserver-volume"
  }
}

resource "aws_volume_attachment" "ebs_attchment" {
    depends_on = [aws_ebs_volume.web-volume,aws_instance.web-server]

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.web-volume.id
  instance_id = aws_instance.web-server.id
  ##force_detach = true   do not use when you have importent data in volume
}

resource "null_resource" "config-webserver" {
    depends_on = [
      aws_instance.web-server,aws_volume_attachment.ebs_attchment
    ]

    connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("C:/path/to/key") ## path of key
    host = aws_instance.web-server.public_ip

  }
  provisioner "remote-exec" {
		inline = [
		"sudo yum  install httpd  -y",
		"sudo  yum  install php  -y",
		"sudo systemctl start httpd",
		"sudo systemctl start httpd",
        "sudo mkfs.ext4 /dev/xvdh",
		"sudo  mount /dev/xvdh  /var/www/html",
		"sudo yum install git -y",
		"sudo git clone https://github.com/vimallinuxworld13/gitphptest.git   /var/www/html/web"

		]
	}
}

resource "null_resource" "nullres3"{
    depends_on = [
      null_resource.config-webserver
    ]
	provisioner "local-exec"{
	command = "chrome http://${aws_instance.web-server.public_ip}/web/index.php"
	}
}

