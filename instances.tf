resource "aws_instance" "web1" {
  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = "aws_gps"
  security_groups = [
      aws_security_group.ec2_sg.id
  ]

  # VPC
  subnet_id = aws_subnet.Public_subnet_az_2.id

  # Security Group
  # vpc_security_group_ids.app_server_sg.
}
