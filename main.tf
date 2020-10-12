provider "aws" {
  profile = "${var.profile}"
  #assume_role {
   # role_arn = "arn:aws:iam::123456789102:role/terraform-admin"
 # } 
   region = "${var.region}"
}

# Including module to create EC2 resources

module "local" {
  source = "./resources"
  #image = "${var.image}"
}
