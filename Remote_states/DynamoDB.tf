resource "aws_dynamodb_table" "dynamoDB-table1" {
  name           = "terraform-dynamoDB"
  hash_key       = "LockID"
  read_capacity  = 2
  write_capacity = 2

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }

}