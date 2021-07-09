resource "aws_vpc" "this" {

  cidr_block           = var.cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  # tags = map(
  #   "Name"       , join ("-", [var.author, var.vpc_name]),
  #   "created-by" , var.author
  #   )
  tags = {
    "Name"       = join("-", [var.vpc_name, var.author]),
    "created-by" = var.author
  }
}