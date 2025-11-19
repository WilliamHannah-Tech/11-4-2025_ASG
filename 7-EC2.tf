# AWS EC2

resource "aws_instance" "mainstreet-ec2" {
  ami                    = "ami-024294779773cf91a" # us-west-2
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.mainstreet-sg.id]
  subnet_id              =  aws_subnet.public-eu-west-2a.id
  associate_public_ip_address = true
  
  user_data = file("user_data.sh")


  

  tags = {
    Name = "mainstreet-ec2"
  }
}