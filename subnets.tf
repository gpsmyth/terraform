# Create a Public n Private Subnet for AZA n B
resource "aws_subnet" "Public_subnet_az_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.Public_subnet_az_1_CIDR
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet 1"
  }

  depends_on = [
    aws_vpc.main
  ]
}


resource "aws_subnet" "Public_subnet_az_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.Public_subnet_az_2_CIDR
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet 2"
  }

  depends_on = [
    aws_vpc.main
  ]
}


resource "aws_subnet" "Private_subnet_az_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.Private_subnet_az_1_CIDR
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "Private Subnet 1"
  }

  depends_on = [
    aws_vpc.main
  ]
}


resource "aws_subnet" "Private_subnet_az_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.Private_subnet_az_2_CIDR
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "Private Subnet 2"
  }

  depends_on = [
    aws_vpc.main
  ]
}