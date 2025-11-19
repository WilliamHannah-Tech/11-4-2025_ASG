# AWS Router

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.mainstreet.id

  route  {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.mainstreet-nat.id
  }

  tags = {
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.mainstreet.id

  route  {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      
    }
  

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private-eu-west2-1a" {
  subnet_id      = aws_subnet.private-eu-west-2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-eu-west2-1b" {
  subnet_id      = aws_subnet.private-eu-west-2b.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-eu-west2-1c" {
  subnet_id      = aws_subnet.private-eu-west-2c.id
  route_table_id = aws_route_table.private.id
}


#public

resource "aws_route_table_association" "public-eu-west2-1" {
  subnet_id      = aws_subnet.public-eu-west-2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-eu-west2-2b" {
  subnet_id      = aws_subnet.public-eu-west-2b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-eu-west2-2c" {
  subnet_id      = aws_subnet.public-eu-west-2c.id
  route_table_id = aws_route_table.public.id
}
