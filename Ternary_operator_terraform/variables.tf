## This Logic you can use to launch infrastructure on production or Development dynamically

variable "is_it_production_ENV" {
  type = bool

}

output "out_1" {
    value = var.is_it_production_ENV ? "Launch in AWS" : "Launch in GCP"
}


## it is if else 
## if true run first that is Launch in AWS
## if false run second that is launch in GCP

