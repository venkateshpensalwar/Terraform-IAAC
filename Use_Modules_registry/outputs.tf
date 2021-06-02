# Here Those outputs will work who are declared as output variable in module

output "kk" {
  value = module.security-group.security_group_id
}