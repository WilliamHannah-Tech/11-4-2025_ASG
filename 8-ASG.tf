#AWS autoscaling laucnch configuration
#Launch Configuration Resource
resource "aws_launch_template" "mainstreet-lt" {
  name_prefix   = "mainstreet-lc"
  image_id      = "ami-024294779773cf91a" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mainstreet-sg.id]

  user_data = filebase64("user_data.sh")
}


 #Autoscaling Group Resource
resource "aws_autoscaling_group" "mainstreet-asg" {
  # launch_configuration = aws_launch_configuration.mainstreet-lc.name
  min_size             = 3
  max_size             = 6
  desired_capacity     = 3
  vpc_zone_identifier  = [aws_subnet.public-eu-west-2a.id, aws_subnet.public-eu-west-2b.id, aws_subnet.public-eu-west-2c.id]

  tag {
    key                 = "Name"
    value               = "mainstreet-asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  launch_template {
    id      = aws_launch_template.mainstreet-lt.id
    version = "$Latest"
}
}


# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.mainstreet-asg.id
  lb_target_group_arn    = aws_lb_target_group.target_group.arn
}


# Autoscaling Policy Resource
resource "aws_autoscaling_policy" "auto_scale_policy" {
  name                   = "foobar3-terraform-test"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.mainstreet-asg.name
}

