resource "aws_ebs_volume" "monitoring" {
  availability_zone = "${aws_instance.monitoring.availability_zone}"
  size              = 20
  type              = "gp2"

  tags {
    Name = "${var.name}-data"
  }

  lifecycle {
    ignore_changes = [
      "size",
    ]
  }
}

resource "aws_volume_attachment" "monitoring" {
  device_name  = "/dev/xvdf"
  instance_id  = "${aws_instance.monitoring.id}"
  volume_id    = "${aws_ebs_volume.monitoring.id}"
  force_detach = true
}
