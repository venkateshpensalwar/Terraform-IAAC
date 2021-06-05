![](../terraform.png)

# Data Sources

Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. Use of data sources allows a Terraform configuration to make use of information defined outside of Terraform, or defined by another separate Terraform configuration.

Each provider may offer data sources alongside its set of resource types.

A data source is accessed via a special kind of resource known as a data resource, declared using a `data Block`.

```HCL
data "name_of_data_source" "any reference_name" {

    attribute according to data source you can see in terraform documentation
}
```

How can you retrieve data

```HCL
output "data-output" {
  value = data.name_of_data_source.any reference_name.
}
```