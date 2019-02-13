#############
# WEBSERVER-1
#############

resource "aws_instance" "web1" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.web_1_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
#  availability_zone           = "ap-southeast-1a"
#  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.common.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.name_prefix}-${var.customer}-web1"
    Customer  = "${var.customer}"
    Component = "Wordpress-1"
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

#############
# WEBSERVER-2
#############

resource "aws_instance" "web2" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.web_2_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
#  availability_zone           = "ap-southeast-1a"
#  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.common.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.name_prefix}-${var.customer}-web2"
    Customer  = "${var.customer}"
    Component = "Wordpress-2"
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

#############
# DATABASE-1
#############

resource "aws_instance" "db1" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.mariadb_1_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
#  availability_zone           = "ap-southeast-1a"
#  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.common.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.name_prefix}-${var.customer}-db1"
    Customer  = "${var.customer}"
    Component = "Mariadb-1"
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

#############
# DATABASE-2
#############

resource "aws_instance" "db2" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.mariadb_2_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
#  availability_zone           = "ap-southeast-1a"
#  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.common.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.name_prefix}-${var.customer}-db2"
    Customer  = "${var.customer}"
    Component = "Mariadb-2"
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

#############
# STORAGE
#############

resource "aws_instance" "storage" {
  ami                         = "${var.base_ami}"
  instance_type               = "${var.storage_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
#  availability_zone           = "ap-southeast-1a"
#  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.common.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "${var.name_prefix}-${var.customer}-storage"
    Customer  = "${var.customer}"
    Component = "NFS-Storage"
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