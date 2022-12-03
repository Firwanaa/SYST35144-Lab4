# Creation of VPC
resource "aws_vpc" "vpc_a4" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "vpc_name" }
}

# Creation of Internet Gateway
resource "aws_internet_gateway" "igw-a4" {
  vpc_id = aws_vpc.vpc_a4.id
  tags   = { Name = "igw-name" }
}

resource "aws_route_table" "RT-public" {
  vpc_id = aws_vpc.vpc_a4.id
  route {
    cidr_block = var.cidr_blocks[0]
    gateway_id = aws_internet_gateway.igw-a4.id
  }
  tags = { Name = "public access routing table" }
}

# Creation of public subnet
resource "aws_subnet" "SN-public-1" {
  vpc_id                  = aws_vpc.vpc_a4.id
  cidr_block              = var.public_address
  map_public_ip_on_launch = true
  availability_zone       = var.azs[0]
  tags                    = { Name = "SN-public-1" }
}

# Creation of private subnet
resource "aws_subnet" "SN-private-1" {
  vpc_id            = aws_vpc.vpc_a4.id
  cidr_block        = var.private_address
  availability_zone = var.azs[1]
  tags              = { Name = "SN-private-1" }
}

# Association of public subnet with public routingtable
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.SN-public-1.id
  route_table_id = aws_route_table.RT-public.id
}
