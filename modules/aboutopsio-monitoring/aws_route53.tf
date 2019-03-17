# data "aws_route53_zone" "main" {
#   zone_id = "${var.route53_zone_id}"
# }
# resource "aws_route53_record" "grafana" {
#   zone_id = "${var.route53_zone_id}"
#   name    = "${local.grafana_domain}"
#   type    = "A"
#   alias {
#     name                   = "${aws_alb.main.dns_name}"
#     zone_id                = "${aws_alb.main.zone_id}"
#     evaluate_target_health = false
#   }
# }
# resource "aws_route53_record" "prometheus" {
#   zone_id = "${var.route53_zone_id}"
#   name    = "${local.prometheus_domain}"
#   type    = "A"
#   alias {
#     name                   = "${aws_alb.main.dns_name}"
#     zone_id                = "${aws_alb.main.zone_id}"
#     evaluate_target_health = false
#   }
# }
# resource "aws_route53_record" "alertmanager" {
#   zone_id = "${var.route53_zone_id}"
#   name    = "${local.alertmanager_domain}"
#   type    = "A"
#   alias {
#     name                   = "${aws_alb.main.dns_name}"
#     zone_id                = "${aws_alb.main.zone_id}"
#     evaluate_target_health = false
#   }
# }

