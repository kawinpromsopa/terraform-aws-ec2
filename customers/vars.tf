#locals {
#  customer = "${terraform.workspace}"
#}

variable "vpc_cidr" {}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "key_name" {
  default = ""
}

variable "s3_bucket_name" {
  default = ""
}

variable "base_ami" {
  default = "ami-a6bec64c"
}

variable "cachet_instance_type" {
  default = "t2.micro"
}

