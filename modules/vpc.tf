resource "aws_security_group" "ssh" {
  name   = "${var.name}-ssh"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.name}"
  }
}

resource "aws_subnet" "a0" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 2, 0)}"
  map_public_ip_on_launch = true
  availability_zone       = "${element(var.availability_zone, 0)}"
}

resource "aws_subnet" "b0" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 2, 1)}"
  map_public_ip_on_launch = true
  availability_zone       = "${element(var.availability_zone, 1)}"
}

resource "aws_subnet" "c0" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 2, 2)}"
  map_public_ip_on_launch = true
  availability_zone       = "${element(var.availability_zone, 2)}"
}

resource "aws_default_route_table" "main" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.name}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_route_table_association" "a0" {
  subnet_id      = "${aws_subnet.a0.id}"
  route_table_id = "${aws_default_route_table.main.id}"
}

resource "aws_route_table_association" "b0" {
  subnet_id      = "${aws_subnet.b0.id}"
  route_table_id = "${aws_default_route_table.main.id}"
}

resource "aws_route_table_association" "c0" {
  subnet_id      = "${aws_subnet.c0.id}"
  route_table_id = "${aws_default_route_table.main.id}"
}
