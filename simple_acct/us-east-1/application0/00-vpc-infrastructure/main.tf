module "vpc" {
  source   = "./modules/vpc"
  region   = var.region
  vpc_name = var.vpc_name
  vpc_id   = module.vpc.vpc_id
  cidr     = var.cidr
}

module "subnets" {
  source = "./modules/subnets"
  region = var.region
  vpc_id = module.vpc.vpc_id
  cidr_block = cidrsubnet("10.0.1.0/20", 4, 1) # works
  # cidr_block = cidrsubnet(module.vpc.cidr, 4, 1)
  # cidr_block = module.vpc.cidr
  # cidr_block   = cidrsubnet(var.cidr, 4, 1) # next part
  # subnet_count = var.subnet_count # next part
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.subnets.subnet_id
  instance_type = "t3.micro"
}
