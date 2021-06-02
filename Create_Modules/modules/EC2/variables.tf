variable "ami" {
    type = string
    description = "amazon machine image"
}

variable "instance_type" {
    type = string
    description = "Enter instance type like t2.micro"
}

variable "key_name" {
    type = string
    description = "Enter Key name"
    default = "key1"
}

variable "list_SG" {
    type = list
    description = "Enter groups in list form"
}

variable "instance_name" {
    type = string
    description = "Enter any name for instance"
}