variable "instance-type" {
  type = map(any)
  default = {
    Development = "t2.micro"
    Production  = "t2.small"
  }
}

variable "key-name" {
  type = map(any)
  default = {
    Development = "dev-key"
    Production  = "prod-key"
  }
}