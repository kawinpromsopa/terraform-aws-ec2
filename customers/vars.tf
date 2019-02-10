##
# Private variables
##

locals {
  customer = "${terraform.workspace}"
}

##
# type value in <customer_vars>
##

variable "vpc_cidr" {}
variable "s3_bucket_name" {}
variable "default_instances_type" {}
variable "cachet_instances_type" {}

## 

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "key_name" {
  default = ""
}

variable "base_ami" {
  default = "ami-0006260d96ccf6695"
}







