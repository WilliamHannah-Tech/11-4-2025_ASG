resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainstreet.id

  tags = {
    Name    = "mainstreet-vpc"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}
