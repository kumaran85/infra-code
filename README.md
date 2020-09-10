While using module, variable can be passed in below ways.

1. specify the variabls in root variables.tf
2. specify under module section to pass it
3. If not specified in any of way, while executing the terraform plan command use --var Or --var-files terraform.tfvars

# How to use assume role

To use assume role, you need to have sts:AssumeRole permission across the accounts.
