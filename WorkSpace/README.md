![](../terraform.png)

### Workspaces are Collections of Infrastructure

When run locally, Terraform manages each collection of infrastructure with a persistent working directory, which contains a configuration, state data, and variables. Terraform Cloud manages infrastructure collections with workspaces instead of directories.
```
Usage: terraform [global options] workspace

  new, list, show, select and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace
```
for this practical you need two environment 
1. Development
2. Production

```CMD
 terraform workspace new 'workspace name'
```



In your IAAC code you can pass workspace keyword so it will take variable values according to workspace.
Example:
```python
   if workspace == Production:
              instance_type = t2.small
   if workspace == Development:
              instance_type = t2.micro
```
The same thing we can do using `lookup` function in terraform we have put lookup on map variable and pass key as workspace name so it will find variables according to that

```
terraform.workspace   // This is inbuilt keyword for workspace
```

```HCL
variable "instance-type"{
  type = map
  default = {
    Development = "t2.micro"
    Production  = "t2.small"
  }
}

resource "aws_instance" "vm_1" {
  ami = "ami-010aff33ed5991201"
  instance_type = lookup(
    var.instance-type, terraform.workspace, "Env Not Found"
  )
  key_name        = lookup(var.key-name, "${terraform.workspace}", "Key Not Found")
  security_groups = ["default"]
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "amazon"
  }
}
```