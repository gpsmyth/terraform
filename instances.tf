resource "aws_instance" "web1" {
  ami           = "${lookup(var.AMI, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # VPC
  subnet_id = "${aws_subnet.ingress_subnet_az_2.id}"

  # Security Group
  vpc_security_group_ids.app_server_sg.
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_gps"
  public_key = ""
}