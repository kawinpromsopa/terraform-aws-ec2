data "template_file" "user_data_monitoring" {
  template = "${file("${path.module}/templates/user_data_monitoring.yml")}"

  vars {
    name = "${var.name}"
  }
}

resource "aws_instance" "monitoring" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.monitoring_instance_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
  key_name                    = "${var.key_name}"
  user_data                   = "${data.template_file.user_data_monitoring.rendered}"
  iam_instance_profile        = "${aws_iam_instance_profile.monitoring.id}"
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ssh.id}",
    "${aws_security_group.monitoring.id}",
  ]

  tags {
    Name      = "${var.name}"
    Component = "Monitoring"
  }

  lifecycle {
    ignore_changes = [
      "ami",
      "ebs_optimized",
      "user_data",
      "root_block_device",
    ]
  }
}

resource "aws_eip" "monitoring" {
  instance = "${aws_instance.monitoring.id}"
  vpc      = true

  tags {
    Name = "${var.name}-monitoring"
  }
}

resource "aws_iam_instance_profile" "monitoring" {
  name = "${var.name}-monitoring"
  role = "${aws_iam_role.monitoring.name}"
}
