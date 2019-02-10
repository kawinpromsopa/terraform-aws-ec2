##
# Public variables
##

locals {
  default_s3_bucket_name      = "${var.customer}"
  s3_bucket_name              = "${var.s3_bucket_name != "" ? var.s3_bucket_name : local.default_s3_bucket_name}"
}

variable "customer" {}
variable "vpc_cidr" {}
variable "key_name" {}

variable "s3_bucket_name" {
  default = ""
}

variable "s3_secret_bucket_name" {
  default = ""
}

variable "force_destroy_s3" {
  default     = false
  description = "Delete all objects before destroying bucket. Enable on dev env only"
}

variable "base_ami" {
  default = "ami-0006260d96ccf6695"
}

variable "default_instances_type" {
  default = "t2.small"
}

variable "cachet_instances_type" {
  default = "t2.small"
}

variable "name" {
  default = "My"
}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}


