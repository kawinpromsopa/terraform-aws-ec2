terraform {
  backend "s3" {
    bucket = "terraform-state.prod"
    region = "ap-southeast-1"
    key    = "globalinsidecpt-monitoring-prod.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

module "aboutopsio-monitoring" {
  source                   = "./../../modules/aboutopsio-monitoring"
  name                     = "${local.customer}"
  region                   = "${var.region}"
  availability_zone        = "${var.availability_zone}"
  vpc_cidr                 = "${var.vpc_cidr}"
  key_name                 = "${var.key_name}"
  monitoring_instance_type = "${var.monitoring_instance_type}"
  base_ami                 = "${var.base_ami}"
  lb_ssl_certificate_id    = ""

  providers {
    # for object in s3 secret bucket
    aws.ap-southeast-1 = "aws.ap-southeast-1"
  }
}
