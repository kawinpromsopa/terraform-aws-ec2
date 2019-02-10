resource "aws_instance" "app" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.default_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
  availability_zone           = "ap-southeast-1a"
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 16
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.customer}-${var.name}-app"
    Customer  = "${var.customer}-${var.name}"
    Component = "app"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      "ami",
      "user_data",
      "root_block_device",
    ]
  }
}

resource "aws_instance" "app2" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.default_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
  availability_zone           = "ap-southeast-1a"
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 16
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.customer}-${var.name}-app2"
    Customer  = "${var.customer}-${var.name}"
    Component = "app"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      "ami",
      "user_data",
      "root_block_device",
    ]
  }
}
