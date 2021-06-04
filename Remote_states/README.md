![Image](../terraform.png)

## Remote State management

Terraform stores state locally in a file named `terraform.tfstate`. When working with Terraform in a team, use of a local file makes Terraform usage complicated because each user must make sure they always have the latest state data before running Terraform and make sure that nobody else runs Terraform at the same time.

With `remote state`, Terraform writes the state data to a remote data store, which can then be shared between all members of a team. Terraform supports storing state in Terraform Cloud, HashiCorp Consul, Amazon S3, Azure Blob Storage, Google Cloud Storage, and more.

Remote state is implemented by a backend, which you can configure in your configuration's root module.

## Backend configuration syntax

```HCL
terraform {
  backend "s3" {
    bucket         = "new-terraform-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-dynamoDB"
  }
}
```


`bucket` = you need to provide bucket name. it stores `terraform.tfstate` file which is current state of your infrastructure `by default it genrates at local machine`.

`key` = filename of state file that is `terraform.tfstate`.

`region` = geographical region where your bucket located.

`dynamodb_table` = you need to provide table name. it stores `.terraform.tfstate.lock.info` this file generates when we apply our infrastructure and if some other team member apply same file at same time with different configurations terraform will restrict that member other wise conflict will come in infrastructure.
