# Create custom route table
resource "aws_route_table" "default" {
  vpc_id = aws_vpc.main.id

  route {
    // associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    // CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.prod-igw.id
  }

  tags = {
    Name = "Default route"
  }
}

resource "aws_route_table_association" "subnet_AZ1" {
  subnet_id      = aws_subnet.Public_subnet_az_1.id
  route_table_id = aws_route_table.default.id
}

resource "aws_route_table_association" "subnet_AZ2" {
  subnet_id      = aws_subnet.Public_subnet_az_2.id
  route_table_id = aws_route_table.default.id
}

resource "aws_network_acl" "allowAll" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}