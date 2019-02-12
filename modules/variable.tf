##################
# Public variables
##################

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
  default = "ami-0b6275906590ad784"
}

variable "default_instances_type" {
  default = "t2.small"
}

variable "cachet_instances_type" {
  default = "t2.small"
}

variable "web_1_instances_type" {
  default = "t2.small"
} 

variable "web_2_instances_type" {
  default = "t2.small"
} 

variable "mairadb_1_instances_type" {
  default = "t2.medium"
} 

variable "mairadb_2_instances_type" {
  default = "t2.medium"
} 

variable "storage_instances_type" {
  default = "t2.small"
} 

variable "name" {
  default = ""
}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "name_prefix" {
  default     = "prod"
  description = "prefix of name tag"
}