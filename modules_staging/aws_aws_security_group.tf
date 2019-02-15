resource "aws_security_group" "common" {
  name   = "${var.name_prefix}-${var.customer}-common"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = ["${aws_vpc.main.cidr_block}"]
  }
 
  ingress {
    # NFS Storage
    from_port   = 2049
    to_port     = 2049
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # MYSQL
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # Galera-custer
    from_port   = 4444
    to_port     = 4444
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # Galera-custer
    from_port   = 4567
    to_port     = 4567
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # Galera-custer
    from_port   = 4568
    to_port     = 4568
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # node exporter
    from_port   = 9100
    to_port     = 9100
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Customer = "${var.customer}"
  }
}

resource "aws_security_group" "ssh" {
  name   = "${var.name_prefix}-${var.customer}-ssh"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Customer = "${var.customer}"
  }
}

resource "aws_security_group" "alb" {
  name   = "${var.name_prefix}-${var.customer}-alb"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.main.cidr_block}"]
  }

  tags {
    Customer = "${var.customer}"
  }
}
