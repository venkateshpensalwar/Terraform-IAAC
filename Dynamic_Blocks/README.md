![](../terraform.png)
# Dynamic Blocks

when we have large amount of same resources we write each in separate blocks but `dynamic blocks` concept
gives more easy to do this.

so whatever content we have in large amount we can create a list of this and pass list in dynamic block
then it automatically create your blocks

### Syntax of Dynamic Blocks

```HCL
variable "SG" {
    type = list
    default = [80,443,3306]
}

resource "resource_name" "variable" {

all the resource attribute that are fixed goes here


dynamic "name of block that going to iterate dynamically(Here ingress Block)"{
        for_each = "variable that going to iterate"
        content {                            // content that will be dynamically created here(ingress rules)

            from_port        = ingress.value    // don't use variable name use dynamic `block_name.`
            to_port          = ingress.value
      }
   }
}
```


Above is example of security group resource and in that we have `ingress rules` there we have multiple ingress rules so instead of writing each ingress block we created dynamic ingress block and we are iterating `ports` from list variable `SG` declared in `variables.tf`

form_port =  dynamic block name and using this iterate value of variable
to_port =  dynamic block name and using this iterate value of variable


### Actual example 
```HCL
variable "SG" {
    type = list
    default = [80,443,3306]
}
resource "aws_security_group" "security_groups" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  tags = {
    Name = "allow_tls"
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
      }
  }

}
```