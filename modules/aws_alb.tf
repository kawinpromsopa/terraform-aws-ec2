resource "aws_alb" "http" {
  name         = "${var.name_prefix}-${var.customer}-http"
  subnets      = ["${aws_subnet.a0.id}", "${aws_subnet.b0.id}", "${aws_subnet.c0.id}"]
  idle_timeout = 1200

  security_groups = [
    "${aws_security_group.alb.id}",
  ]

  tags {
    Customer = "${var.customer}"
  }
}

resource "aws_alb_target_group" "default" {
  name                 = "${var.name_prefix}-${var.customer}-default"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = "${aws_vpc.main.id}"
  deregistration_delay = 60

  health_check {
    path                = "/login"
    matcher             = "200,302"
    interval            = 15
    healthy_threshold   = 2
    unhealthy_threshold = 4
  }
}

resource "aws_alb_target_group" "http" {
  name                 = "${var.name_prefix}-${var.customer}-http"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = "${aws_vpc.main.id}"
  deregistration_delay = 60

  health_check {
    path                = "/login"
    matcher             = "200,302"
    interval            = 15
    healthy_threshold   = 2
    unhealthy_threshold = 4
  }
}


resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.http.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.default.arn}"
    type             = "forward"
  }
}

########################################## 
# must have "lb_ssl_certificate_id" on aws
########################################## 

#resource "aws_alb_listener" "https" {
#  load_balancer_arn = "${aws_alb.http.arn}"
#  port              = "443"
#  protocol          = "HTTPS"
#  certificate_arn   = ""
#  ssl_policy        = "ELBSecurityPolicy-2016-08"

#  default_action {
#    target_group_arn = "${aws_alb_target_group.default.arn}"
#    type             = "forward"
#  }
#}
