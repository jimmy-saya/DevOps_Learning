resource "aws_lb" "node-web-app-alb" {
  name                  = "node-web-app-alb"
  internal              = false
  load_balancer_type    = "application"
  security_groups       = [aws_security_group.allow_http.id]
  subnets               = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id, aws_default_subnet.default_az3.id]

}

resource "aws_lb_target_group" "node-web-app-target-group" {
  name          = "node-web-app-target-group"
  port          = 80
  protocol      = "HTTP"
  target_type   = "instance"
  vpc_id        = aws_default_vpc.default.id
}

#resource "aws_lb_target_group_attachment" "node-web-app-target-group-attachement" {
#  target_group_arn = aws_lb_target_group.node-web-app-target-group.arn
#  target_id        = aws_instance.nodejs.id
#  port             = 80
#}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.node-web-app-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.node-web-app-target-group.arn
  }
}