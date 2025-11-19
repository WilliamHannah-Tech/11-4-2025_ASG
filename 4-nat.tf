# AWS Nat 

resource "aws_eip" "mainstreet-nat" {
  
  tags = {
    Name = "mainstreet-nat"
  }
}

resource "aws_nat_gateway" "mainstreet-nat" {
  allocation_id = aws_eip.mainstreet-nat.id
  subnet_id     = aws_subnet.public-eu-west-2a.id

  tags = {
    Name = "mainstreet-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
