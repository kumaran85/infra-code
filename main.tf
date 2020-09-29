provider "aws" {
  profile = "${var.profile}"
  #assume_role {
   # role_arn = "arn:aws:iam::608014515287:role/a204161-CloudOps"
 # } 
   region = "${var.region}"
}

# Including module to create EC2 resources

module "local" {
  source = "./resources"
  #image = "${var.image}"
}
