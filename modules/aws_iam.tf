data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "launchconfig" {
  name_prefix        = "${var.name}-ec2-lc-"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.instance_assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "launchconfig_ecr_readonly" {
  role       = "${aws_iam_role.launchconfig.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

data "aws_iam_policy_document" "ec2_create_snapshot" {
  statement {
    actions = [
      "ec2:CreateSnapshot",
      "ec2:CreateTags",
    ]

    resources = [
      "arn:aws:ec2:*:*:snapshot/*",
      "arn:aws:ec2:*:*:volume/*",
    ]
  }
}

resource "aws_iam_role" "db" {
  name_prefix        = "${var.name}-db-"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.instance_assume_role_policy.json}"
}

resource "aws_iam_policy" "ec2_create_snapshot" {
  name_prefix = "${var.name}-ec2-create-snapsnot-"
  path        = "/"
  description = "Managed by Terraform"
  policy      = "${data.aws_iam_policy_document.ec2_create_snapshot.json}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "db_ec2_create_snapshot" {
  role       = "${aws_iam_role.db.name}"
  policy_arn = "${aws_iam_policy.ec2_create_snapshot.arn}"
}