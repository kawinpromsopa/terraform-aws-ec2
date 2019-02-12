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
    Name      = "${var.name_prefix}-${var.customer}-web1"
    Customer  = "${var.customer}"
    Component = "web1"
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

