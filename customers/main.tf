terraform {
  backend "s3" {
    bucket = ""
    region = "ap-southeast-1"
    key    = ""
  }
}

provider "aws" {
  region = "${var.region}"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

module "aboutopsio" {
  source                      = "../modules"
  customer                    = "${local.customer}"
  region                      = "${var.region}"
  availability_zone           = "${var.availability_zone}"
  vpc_cidr                    = "${var.vpc_cidr}"
  key_name                    = "${var.key_name}"
  default_instances_type      = "${var.default_instances_type}"
  cachet_instances_type       = "${var.cachet_instances_type}"
  base_ami                    = "${var.base_ami}"

  providers {
    # for object in s3 secret bucket
    aws.ap-southeast-1 = "aws.ap-southeast-1"
  }
}

#output "cachet_instances_type" {
#  value = "${aws_instance.cachet.public_ip}"
#}