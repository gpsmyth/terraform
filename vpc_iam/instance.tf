resource "aws_instance" "web1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # The AWS keypair
  key_name = var.key_name

  # As   cidr_block = "10.0.1.0/24" for main-public-1, let's assign a private ip
  private_ip = "10.0.1.4" # Static private ip

  # role:
  iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}

output "ip" {
  value = aws_instance.web1.public_ip
}

