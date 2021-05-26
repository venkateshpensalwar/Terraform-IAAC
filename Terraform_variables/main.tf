## How to create variables?

## normally we have hundreds of variables so we create variables.tf file so from next practicles
## we will use that one

# String data type
variable "var_1" {                              ## "var_1" == you can give any name
    type = string                         ## data type
    default = "xyz"                       ## default if any data not set

}

variable "var_2" {
     type = number
     default = 1234.235               ## you can use fraction or normal integer
}

variable "var_3" {
    type = bool
    default = true                      ## you can use true or flase
}

variable "var_4" {
    type = list
    default = [1,"xyz"]                    ## you need to pass list
}

variable "var_5" {
    type = map
    default = {
        name = "xyz",                      ## you need to pass dictionary
        age = 20
    }
}

## if you want to take input from user dont pass default value

variable "var_6" {
    type = string
}

## How to print variables?

# First method
output "out_1" {
    value = var.var_1
}

# Second method
output "out_2" {
    value = "${var.var_5}"                 ## if you want to print this variablr inside string you can use this way
}

# prompted value will put here
output "out_3" {
    value = var.var_6
}

