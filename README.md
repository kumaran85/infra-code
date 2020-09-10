While using module, variable can be passed in below ways.

1. specify the variable in root variables.tf
2.  If you specify variable, under module section to pass it and should be removed in the main variables.tf.
3. If you want to specify variable from module variables.tf, then remove from main variables.tf and pass it in module variables.tf. Don't specify it under module as var.image or image="ami-123"
3. If not specified in any of way, while executing the terraform plan command use --var Or --var-files terraform.tfvars.
4. Variables can't be passed to other modules

# How to use assume role

To use assume role, you need to have sts:AssumeRole permission across the accounts.
