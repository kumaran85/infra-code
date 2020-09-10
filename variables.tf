variable "profile" {
  description = "stored crdentials from .aws dir"
  default = "tr-fr"
}

variable "region" {
  description = "where EC2 instnace needs to be created"
  default = "eu-west-1"
}

variable "image" {
   description = "Image will take from Module variables.tf"
}

