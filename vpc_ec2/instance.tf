resource "aws_instance" "web1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh_http.id]

  # The AWS keypair
  key_name = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo su 
              yum -y install httpd
              echo "<p> My Instance! </p>" >> /var/www/html/index.html
              sudo systemctl enable httpd
              sudo systemctl start httpd
              EOF
}

output "ip" {
  # value = "aws_instance.web1.public_ip"
  value = "aws_eip.ip.public_ip"
}

