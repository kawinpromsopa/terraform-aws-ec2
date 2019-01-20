variable "vpc_cidr" {}

variable "instances_ami" {
  default = "ami-0006260d96ccf6695"
}

variable "instances_type" {
  default = "t2.small"
}

variable "name" {
  default = "CRM-C"
}

# Use with bash scripts
#locals {
#  customer = "${terraform.workspace}"
#}

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

variable "cachet_instance_type" {
  default = "t2.micro"
}
