data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "monitoring" {
  statement {
    actions = ["sns:ListPlatformApplications"]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "monitoring" {
  name_prefix = "${var.name}-monitoring"
  path        = "/"
  policy      = "${data.aws_iam_policy_document.monitoring.json}"
}

resource "aws_iam_policy" "monitoring_cloudwatch" {
  name_prefix = "${var.name}-monitoring-cloudwatch-"
  path        = "/"
  description = "Managed by Terraform"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowReadingMetricsFromCloudWatch",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowReadingTagsFromEC2",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeTags",
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
        }
    ]
}
EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "monitoring" {
  name               = "${var.name}-monitoring"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.instance_assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "monitoring_ecr_readonly" {
  role       = "${aws_iam_role.monitoring.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "monitoring_cloudwatch" {
  role       = "${aws_iam_role.monitoring.name}"
  policy_arn = "${aws_iam_policy.monitoring_cloudwatch.arn}"
}

resource "aws_iam_role_policy_attachment" "monitoring" {
  role       = "${aws_iam_role.monitoring.name}"
  policy_arn = "${aws_iam_policy.monitoring.arn}"
}
