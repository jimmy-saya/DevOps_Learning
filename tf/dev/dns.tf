#resource "aws_route53_zone" "primary" {
#  name = "jimmy-test.com"
#}

data "aws_route53_zone" "primary" {
  name         = "jimmy-test.com."
}

resource "aws_route53_record" "myapp" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "myapp"
  type    = "A"

  alias {
    name                   = aws_lb.node-web-app-alb.dns_name
    zone_id                = aws_lb.node-web-app-alb.zone_id
    evaluate_target_health = true
  }
}