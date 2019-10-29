resource aws_eip "webserver" {
  // instance = aws_instance.webserver.id
  vpc        = true
  depends_on = [aws_internet_gateway.prod-igw]
}