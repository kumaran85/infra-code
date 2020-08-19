provider "aws" {
  profile = "{var.profile}"
  region = "ap-southeast-1"

}
# Including module to create EC2 resources

module "local" {
  source = "./resources"
  image = "${var.image}"
}


