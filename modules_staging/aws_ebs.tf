resource "aws_ebs_volume" "db1" {
  availability_zone = "${aws_instance.db1.availability_zone}"
  size              = "${var.db1_volume_size}"
  type              = "gp2"

  tags {
    Name     = "${var.customer}-db1"
    Customer = "${var.customer}"
    Type     = "db1"
    Snapshot = "db1"
  }

  lifecycle {
    ignore_changes = [
      "size",
      "snapshot_id",
    ]
  }
}

resource "aws_ebs_volume" "db2" {
  availability_zone = "${aws_instance.db2.availability_zone}"
  size              = "${var.db2_volume_size}"
  type              = "gp2"

  tags {
    Name     = "${var.customer}-db2"
    Customer = "${var.customer}"
    Type     = "db2"
    Snapshot = "db2"
  }

  lifecycle {
    ignore_changes = [
      "size",
      "snapshot_id",
    ]
  }
}

resource "aws_ebs_volume" "storage" {
  availability_zone = "${aws_instance.storage.availability_zone}"
  size              = "${var.storage_volume_size}"
  type              = "gp2"

  tags {
    Name     = "${var.customer}-storage"
    Customer = "${var.customer}"
    Type     = "storage"
    Snapshot = "storage"
  }

  lifecycle {
    ignore_changes = [
      "size",
      "snapshot_id",
    ]
  }
}

resource "aws_volume_attachment" "db1" {
  device_name  = "/dev/xvdf"
  volume_id    = "${aws_ebs_volume.db1.id}"
  instance_id  = "${aws_instance.db1.id}"
  force_detach = true
}

resource "aws_volume_attachment" "db2" {
  device_name  = "/dev/xvdf"
  volume_id    = "${aws_ebs_volume.db2.id}"
  instance_id  = "${aws_instance.db2.id}"
  force_detach = true
}

resource "aws_volume_attachment" "storage" {
  device_name  = "/dev/xvdf"
  volume_id    = "${aws_ebs_volume.storage.id}"
  instance_id  = "${aws_instance.storage.id}"
  force_detach = true
}