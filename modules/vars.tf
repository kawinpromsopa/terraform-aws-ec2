variable "vpc_cidr" {}

variable "instances_ami" {
  description = "Amazon Machine Image for the Instance"
  default = "ami-21bdc5cb"
}

variable "instances_type" {
  description = "type of instances to provision"
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

variable "base_ami" {
  default = "ami-a6bec64c"
}

variable "cachet_instance_type" {
  default = "t2.micro"
}
