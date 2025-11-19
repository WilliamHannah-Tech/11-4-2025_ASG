resource "aws_lb_target_group" "target_group" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mainstreet.id
}

