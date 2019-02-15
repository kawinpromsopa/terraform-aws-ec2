terraform {
  backend "s3" {
    bucket = "terraform-state.staging"
    region = "ap-southeast-1"
    key    = "globalinsidecpt-staging.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

module "aboutopsio-staging" {
  source                      = "./../../modules_staging"
  customer                    = "${local.customer}"
  region                      = "${var.region}"
  availability_zone           = "${var.availability_zone}"
  vpc_cidr                    = "${var.vpc_cidr}"
  key_name                    = "${var.key_name}"
  web_1_instances_type        = "${var.web_1_instances_type}"
  web_2_instances_type        = "${var.web_2_instances_type}"
  mariadb_1_instances_type    = "${var.mariadb_1_instances_type}"
  mariadb_2_instances_type    = "${var.mariadb_2_instances_type}"
  storage_instances_type      = "${var.storage_instances_type}"
  base_ami                    = "${var.base_ami}"
  s3_bucket_name              = "${var.s3_bucket_name}"
#  s3_secret_bucket_name       = "eko-secret-bucket"

  providers {
    # for object in s3 secret bucket
    aws.ap-southeast-1 = "aws.ap-southeast-1"
  }
}

