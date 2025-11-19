resource "aws_lb" "street-lb" {
  name               = "street-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mainstreet-sg.id]
  subnets            = [aws_subnet.public-eu-west-2a.id, aws_subnet.public-eu-west-2b.id, aws_subnet.public-eu-west-2c.id]

  enable_deletion_protection = true

 
  tags = {
    Environment = "production"
  }
}

#LB Listerner  *******

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.street-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
