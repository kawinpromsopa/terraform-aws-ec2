####################
# Private variables
####################

locals {
  customer = "${terraform.workspace}"
}

################################
# type value in <customer_vars>
################################

variable "vpc_cidr" {}
variable "s3_bucket_name" {}

variable "default_instances_type" {
  default = "t3.nano"
}
variable "cachet_instances_type" {
  default = "t3.nano"
}

variable "web_1_instances_type" {
  default = "t3.nano"
} 

variable "web_2_instances_type" {
  default = "t3.nano"
} 

variable "mariadb_1_instances_type" {
  default = "t3.nano"
} 

variable "mariadb_2_instances_type" {
  default = "t3.nano"
} 

variable "storage_instances_type" {
  default = "t3.nano"
} 

################################

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}


################
# key_pair_name
################

variable "key_name" {
  default = "aboutops.io-prod"
}

variable "base_ami" {
  default = "ami-0b6275906590ad784"
}









