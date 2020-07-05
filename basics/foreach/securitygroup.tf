resource "aws_security_group" "sg_allow_ssh_http" {
  vpc_id      = "vpc-myid"
  name        = "allow-ssh_http" # can use expressions here
  description = "security group that allows ssh/http and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Example 1 - This works at a basic level - note ingress.value is used here
  # since the default iterator is the label of the dynamic block.
  # dynamic "ingress" {
  #   for_each = [22, 80, 443]
  #   content {
  #     from_port   = ingress.value
  #     to_port     = ingress.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }

  # Example 2
  # Instead of declaring two separate ingress blocks, we declared a single dynamic ingress block. 
  # We also specified the iterator argument as port. (Don't use quotes.) If we had not done that, 
  # then we would have used ingress.value instead of port.value 
  # in the code since the default iterator is the label of the dynamic block.

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "ports" {
  value = aws_security_group.sg_allow_ssh_http.ingress[*].from_port # new version
  #value = aws_security_group.sg_allow_ssh_http.ingress.*.from_port # old version
}