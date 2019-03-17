# resource "aws_alb" "main" {
#   name    = "${var.name}-main"
#   subnets = ["${aws_subnet.a0.id}", "${aws_subnet.b0.id}", "${aws_subnet.c0.id}"]
#   security_groups = [
#     "${aws_security_group.alb.id}",
#   ]
# }
# resource "aws_alb_target_group" "monitoring" {
#   name                 = "${var.name}-monitoring"
#   port                 = 80
#   protocol             = "HTTP"
#   vpc_id               = "${aws_vpc.main.id}"
#   deregistration_delay = 60
#   health_check {
#     matcher             = "200-499"
#     interval            = 10
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }
# }
# resource "aws_alb_target_group" "default" {
#   name                 = "${var.name}-default"
#   port                 = 80
#   protocol             = "HTTP"
#   vpc_id               = "${aws_vpc.main.id}"
#   deregistration_delay = 60
#   health_check {
#     matcher             = "200-499"
#     interval            = 10
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }
# }
# resource "aws_alb_listener" "http" {
#   load_balancer_arn = "${aws_alb.main.arn}"
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     target_group_arn = "${aws_alb_target_group.default.arn}"
#     type             = "forward"
#   }
# }
# resource "aws_alb_listener" "https" {
#   load_balancer_arn = "${aws_alb.main.arn}"
#   port              = "443"
#   protocol          = "HTTPS"
#   certificate_arn   = "${var.lb_ssl_certificate_id}"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   default_action {
#     target_group_arn = "${aws_alb_target_group.default.arn}"
#     type             = "forward"
#   }
# }
# resource "aws_lb_target_group_attachment" "default_monitoring" {
#   target_group_arn = "${aws_alb_target_group.default.arn}"
#   target_id        = "${aws_instance.monitoring.id}"
#   port             = 80
# }

