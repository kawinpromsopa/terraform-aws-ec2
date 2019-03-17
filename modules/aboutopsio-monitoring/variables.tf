#################
# Variables public
#################

variable "name" {}

variable "vpc_cidr" {}
variable "key_name" {}
variable "lb_ssl_certificate_id" {}

# variable "route53_zone_id" {}

# variable "grafana_domain" {}

# variable "prometheus_domain" {}

# variable "alertmanager_domain" {}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "monitoring_instance_type" {
  default = "t3.micro"
}

variable "base_ami" {
  default = "ami-0b6275906590ad784"
}

# locals {
#   domain_name                 = "${substr(data.aws_route53_zone.main.name, 0, length(data.aws_route53_zone.main.name)-1)}"
#   default_grafana_domain      = "grafana.${local.domain_name}"
#   default_prometheus_domain   = "prometheus.${local.domain_name}"
#   default_alertmanager_domain = "alertmanager.${local.domain_name}"
#   grafana_domain              = "${var.grafana_domain != "" ? var.grafana_domain : local.default_grafana_domain}"
#   prometheus_domain           = "${var.prometheus_domain != "" ? var.prometheus_domain : local.default_prometheus_domain}"
#   alertmanager_domain         = "${var.alertmanager_domain != "" ? var.alertmanager_domain : local.default_alertmanager_domain}"
# }

