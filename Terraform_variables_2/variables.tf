# This is second way we can pass variable values

# follwing variable will not ask for input but if we want overide value?

# Ans:- create terraform.tfvars file and pass varibles values in this way varaible = "value"
     # if you change terraform.tfvars name to other you need to pass -var-file=" " on command line

# Ans2:- if you need to change one variable so you can pass it on command line
         # terraform apply -var "var_name = your_value"

variable "var_1" {
    type = string
    default = "xyz"

}

output "out_1" {
    value = var.var_1
}