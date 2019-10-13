# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region = "${var.AWS_REGION}"
}

# Create a VPC
resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "default"
    enable_dns_support = true   // gives you an internal domain name
    enable_dns_hostnames = true // gives you an internal host name
    # enable_classiclink = false

    tags = {
        Name = "main"
        Location = "Wellington"
    }
}

# Create a Subnet
# resource "aws_subnet" "subnet1" {
#     vpc_id     = "${aws_vpc.main.id}"
#     cidr_block = "10.0.1.0/24"
#     map_public_ip_on_launch = true //it makes this a public subnet

#     tags = {
#         Name = "Public subnet1"
#     }
# }

# Create IGW
resource "aws_internet_gateway" "prod-igw" {
    vpc_id = "${aws_vpc.main.id}"
    
    tags = {
        Name = "prod-igw"
    }
    depends_on = [
        "aws_vpc.main"
  ]
}

# Create custom route table
resource "aws_route_table" "prod-public-crt" {
    vpc_id = "${aws_vpc.main.id}"
    
    route {
        // associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        // CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.prod-igw.id}" 
    }
    
    tags = {
        Name = "prod-public-crt"
    }
}
