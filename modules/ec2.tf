resource "aws_instance" "cachet" {
  ami                         = "${var.instances_ami}"
  instance_type               = "${var.instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
  availability_zone           = "ap-southeast-1a"
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.name}-cachet"
    Component = "cachet-mysql"
    Customer  = "${var.name}"
    Project   = "stack-monitoring-page-system"
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
