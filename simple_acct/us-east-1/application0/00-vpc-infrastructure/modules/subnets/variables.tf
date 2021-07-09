variable "region" {
  description = "AWS region"
}

# variable "vpc_name" {
#   description = "Name of the VPC to deploy subnets to"
# }

variable "vpc_id" {
  description = "AWS ID of the VPC to deploy subnets to"
  default     = ""
}

variable "cidr_block" {
  description = "Classless Inter-Domain Routing range for the VPC"
}

# variable "subnet_count" {
#   description = "Number of subnets"
# }