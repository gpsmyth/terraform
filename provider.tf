# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-2"
}

# Create a VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "main"
        Location = "Wellington"
    }
}

# Create a Subnet
resource "aws_subnet" "subnet1" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "subnet1"
    }
}
