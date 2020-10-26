resource "aws_cloudwatch_metric_alarm" "Test_Alarm" {
  alarm_name                = "Test_Alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "3"
  metric_name               = "GroupInServiceInstances"
  namespace                 = "AWS/AutoScaling"
  statistic                 = "SampleCount"
  threshold                 = "3"
  period                    = "60"
  #statistic                 = "Average"
  #threshold                 = "80"
  #alarm_description         = "This metric monitors ec2 cpu utilization"
  #insufficient_data_actions = []
  insufficient_data_actions = [aws_autoscaling_policy.Scaling_Policy.arn]
}