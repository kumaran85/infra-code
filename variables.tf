variable "profile" {
  description = "stored crdentials from .aws dir"
  type = string
}

variable "region" {
  description = "where EC2 instnace needs to be created"
  default = "eu-west-1"
}

#variable "image" {
  # description = "Image will take from Module variables.tf"
#}

#variable "sg" {
#  description = "map the bastion SG using -var command"
#}

variable "env" {
   default = "proxy"
}
