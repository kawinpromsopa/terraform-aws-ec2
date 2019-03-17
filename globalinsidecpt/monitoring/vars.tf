####################
# Private variables
####################

locals {
  customer = "${terraform.workspace}"
}

variable "vpc_cidr" {}
variable "s3_bucket_name" {}

variable "default_instance_type" {
  default = "t3.nano"
}

variable "monitoring_instance_type" {
  default = "t3.micro"
}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "key_name" {
  default = "aboutops.io-prod"
}

variable "base_ami" {
  default = "ami-0b6275906590ad784"
}
