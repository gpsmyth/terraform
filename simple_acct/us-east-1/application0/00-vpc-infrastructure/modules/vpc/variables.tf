variable "region" {
  description = "AWS region"
}

variable "vpc_name" {
  description = "Name of the VPC to deploy subnets to"
}

variable "vpc_id" {
  description = "AWS ID of the VPC to deploy subnets to"
  default     = ""
}

variable "cidr" {
  description = "Classless Inter-Domain Routing range for the VPC"
}

variable "enable_dns_support" {
  description = "Indicates whether DNS resolution is supported"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Indicates whether instances with public IP addresses get corresponding public DNS hostnames"
  default     = true
}

variable "author" {
  description = "Indicates the subnets were created through Terraform"
  default     = "terraform"
}