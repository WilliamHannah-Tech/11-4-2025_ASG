resource "aws_vpc" "mainstreet" {
  cidr_block           = "10.25.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name = "mainstreet-vpc"
    Service = "vpc"
    Owner   = "William"
    Planet  = "Earth"
  


enable_dns_support = true
enable_dns_hostnames = true
}

}
