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
  default = "t2.nano"
}

variable "cachet_instances_type" {
  default = "t2.nano"
}

variable "web_1_instances_type" {
  default = "t2.nano"
} 

variable "web_2_instances_type" {
  default = "t2.nano"
} 

variable "mariadb_1_instances_type" {
  default = "t2.nano"
} 

variable "mariadb_2_instances_type" {
  default = "t2.nano"
} 

variable "storage_instances_type" {
  default = "t2.nano"
} 

variable "db1_volume_size" {
  default = "20"
}

variable "db2_volume_size" {
  default = "20"
}

variable "storage_volume_size" {
  default = "20"
}

variable "name" {
  # name of stage
  default = "dev"
}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "name_prefix" {
  default     = "dev"
  description = "prefix of name tag"
}