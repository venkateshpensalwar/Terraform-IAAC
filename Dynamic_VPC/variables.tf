variable "CIDR" {
    default = "10.0.0.0/16"
}

variable "subnets" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]

}

variable "az-zons" {
    type = list
    default = ["ap-south-1a","ap-south-1b"]
}
