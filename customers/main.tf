provider "aws" {
  region = "${var.region}"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

module "cachet" {
  source                      = "../modules"
# customer                    = "${local.customer}" # Use with bash scripts
  region                      = "${var.region}"
  availability_zones          = "${var.availability_zones}"
  vpc_cidr                    = "${var.vpc_cidr}"
  key_name                    = "${var.key_name}"
  cachet_instance_type        = "${var.cachet_instance_type}"
  base_ami                    = "${var.base_ami}"

  providers {
    # for object in s3 secret bucket
    aws.ap-southeast-1 = "aws.ap-southeast-1"
  }
}

