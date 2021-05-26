provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

resource "aws_vpc" "t-vpc" {

   cidr_block = var.CIDR
   tags = {
       Name = "Terraform-vpc"
   }
}

resource "aws_internet_gateway" "internet-gatway" {

  depends_on = [ aws_vpc.t-vpc ]

    vpc_id = aws_vpc.t-vpc.id
    tags = {
           Name = "Terraform-ig"
    }
}

resource "aws_subnet" "subnets" {

    depends_on = [ aws_vpc.t-vpc,aws_internet_gateway.internet-gatway ]

   count = length(var.subnets)
   vpc_id = aws_vpc.t-vpc.id
   map_public_ip_on_launch = true
   availability_zone = element(var.az-zons,count.index)
   cidr_block = element(var.subnets,count.index)
   tags = {
     Name = "subnet-${count.index+1}"
   }
}

resource "aws_route_table" "t-route" {

    depends_on = [ aws_vpc.t-vpc,aws_internet_gateway.internet-gatway ]

     vpc_id = aws_vpc.t-vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internet-gatway.id
    } 

    tags = {
      Name = "Terraform-RouteTable"
    }
}

resource "aws_route_table_association" "t-associate" {

        depends_on = [ aws_subnet.subnets,aws_route_table.t-route]

        count = length(var.subnets)
        subnet_id      = element(aws_subnet.subnets.*.id,count.index)
        route_table_id = aws_route_table.t-route.id

}