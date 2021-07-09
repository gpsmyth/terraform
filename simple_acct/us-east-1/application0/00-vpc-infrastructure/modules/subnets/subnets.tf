resource "aws_subnet" "this" {
  # count      = var.subnet_count
  # count = var.private_sn_count
  # vpc_id     = aws_vpc.this.id
  # vpc_id            = data.aws_vpc.selected.id
  vpc_id = var.vpc_id
  #  cidr_block = "10.0.1.0/24"
  # cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)
  # cidr_block = cidrsubnet("10.0.1.0/20", 4, 1)  # works
  # cidr_block = cidrsubnet(var.cidr, 4, 1)
  # [for index in range(2): cidrsubnet("10.0.0.0/20", 4, index)]
  cidr_block = var.cidr_block
}