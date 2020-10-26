data "template_file" "user_data" {
  template = <<-EOF
        #! /bin/bash
        sudo docker run -d --name node-web-app-c -p 80:8080 -v node-web-volume:/usr/src/app jimmy/node-web-app
    EOF
}

resource "aws_launch_template" "First_LT" {
    name                        = "First_LT"
    image_id                    = "ami-0f5b11915630c7f4e"
    instance_type               = "t2.micro"
    key_name                    = "ubuntu_desktop"
    vpc_security_group_ids      = [aws_security_group.allow_http_from_alb.id]
    user_data                   = base64encode(data.template_file.user_data.rendered)
}

resource "aws_autoscaling_group" "First_AG" {
    name                            = "First_AG"
    availability_zones              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    #desired_capacity                = 1
    min_size                        = 1
    max_size                        = 5
    health_check_grace_period       = 300
    health_check_type               = "ELB"
    target_group_arns               = [aws_lb_target_group.node-web-app-target-group.arn]
    launch_template {
      id        = aws_launch_template.First_LT.id
      version   = "$Latest"
    }
  
}

resource "aws_autoscaling_policy" "Scaling_Policy" {
  name                      = "Scaling_Policy"
  adjustment_type           = "ChangeInCapacity"
  scaling_adjustment        = 2
  #estimated_instance_warmup = 60
  autoscaling_group_name    = aws_autoscaling_group.First_AG.name
}