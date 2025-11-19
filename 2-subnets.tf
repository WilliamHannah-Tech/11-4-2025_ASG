# Pubic subnets

resource "aws_subnet" "public-eu-west-2a" {
  vpc_id                  = aws_vpc.mainstreet.id
  cidr_block              = "10.25.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2a"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-eu-west-2b" {
  vpc_id                  = aws_vpc.mainstreet.id
  cidr_block              = "10.25.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2b"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}


resource "aws_subnet" "public-eu-west-2c" {
  vpc_id                  = aws_vpc.mainstreet.id
  cidr_block              = "10.25.3.0/24"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2c"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}

# Private subnets

resource "aws_subnet" "private-eu-west-2a" {
  vpc_id            = aws_vpc.mainstreet.id
  cidr_block        = "10.25.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "private-eu-west-2a"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-eu-west-2b" {
  vpc_id            = aws_vpc.mainstreet.id
  cidr_block        = "10.25.12.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "private-eu-west-2b"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}


resource "aws_subnet" "private-eu-west-2c" {
  vpc_id            = aws_vpc.mainstreet.id
  cidr_block        = "10.25.13.0/24"
  availability_zone = "eu-west-2c"

  tags = {
    Name    = "private-eu-west-2c"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  }
}
