resource "aws_s3_bucket" "main" {
  bucket        = "${local.s3_bucket_name}"
  acl           = "private"
  force_destroy = "${var.force_destroy_s3}"
  region        = "${var.region}"

  tags {
    Name     = "${local.s3_bucket_name}"
    Customer = "${var.customer}"
  }
}