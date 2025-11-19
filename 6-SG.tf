# Security Group

resource "aws_security_group" "mainstreet-sg" {
  name        = "mainstreet-sg"
  description = "Allow inbound traffic and all outbound traffic to mainstreet"
  vpc_id      = aws_vpc.mainstreet.id

  tags = {
    Name = "mainstreet-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_mainstreet-sg-ssh" {
  description       = "SSH from anywhere"  
  security_group_id = aws_security_group.mainstreet-sg.id
  cidr_ipv4         = "0.0.0.0/8"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "mainstreet-sg-http" {
  description       = "HTTP from anywhere"  
  security_group_id = aws_security_group.mainstreet-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  } 
}  


resource "aws_vpc_security_group_egress_rule" "mainstreet-sg-egress-allow-all_traffic_ipv4" {
  security_group_id = aws_security_group.mainstreet-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

