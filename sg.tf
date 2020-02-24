resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for ALB, port 80 both ways
resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.Private_subnet_az_1_CIDR}"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.Private_subnet_az_2_CIDR}"]
  }

  tags = {
    Name = "alb_sg"
  }

  depends_on = [
    aws_vpc.main
  ]
}


# Security group to App Server, port 80 inbound from both public AZs as well as port 22
resource "aws_security_group" "app_server_sg" {
  name        = "app_server_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.Public_subnet_az_1_CIDR}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.Public_subnet_az_2_CIDR}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.Public_subnet_az_1_CIDR}"]
  }

  tags = {
    Name = "app_server_sg"
  }

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    // cidr_blocks = ["${var.bastion_ssh_from}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.Private_subnet_az_1_CIDR}"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.Private_subnet_az_2_CIDR}"]
  }

  /*
  Consider
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  */
  
  tags = {
    Name = "bastion_sg"
  }

  depends_on = [
    aws_vpc.main
  ]
}

/*
Classic loadbalancer
resource "aws_security_group" "load_balancer" {
  name = "elb-${var.component}-${var.deployment_identifier}"
  description = "ELB for component: ${var.component}, deployment: ${var.deployment_identifier}"
  vpc_id = var.vpc_id
}
*/