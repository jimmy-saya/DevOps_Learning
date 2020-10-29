resource "aws_cloudwatch_metric_alarm" "Test_Alarm" {
  alarm_name                = "Test_Alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "2"
  metric_name               = "GroupInServiceInstances"
  namespace                 = "AWS/AutoScaling"
  statistic                 = "Maximum"

  threshold                 = "2"
  period                    = "60"
  datapoints_to_alarm       = "1"
  alarm_actions             = [aws_autoscaling_policy.Scaling_Policy.arn, "arn:aws:sns:eu-west-1:091223163122:test_opic"]
  dimensions = {
    AutoScalingGroupName  = aws_autoscaling_group.First_AG.name
  }

}