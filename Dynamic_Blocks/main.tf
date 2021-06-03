provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

resource "aws_security_group" "security_groups" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  tags = {
    Name = "Dynamic Security group"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

dynamic "ingress" {
      for_each = var.SG
      content {
            description      = "TLS from VPC"
            from_port        = ingress.value
            to_port          = ingress.value
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
      }
  }

}